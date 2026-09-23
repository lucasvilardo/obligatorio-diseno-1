using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PRecibe
    {
        internal void AltaRecibe(Usuario unUsu, int numIdenti, SqlTransaction miTRN)
        {
            SqlCommand _comando = new SqlCommand("AltaReciben", miTRN.Connection);

            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@numIdenti", numIdenti);
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);
            SqlParameter _retorno = new SqlParameter("@retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _comando.Transaction = miTRN;
                _comando.ExecuteNonQuery();

                int retorno = Convert.ToInt32(_retorno.Value);
                if (retorno == -1)
                    throw new Exception("Usuario Invalido");
                else if (retorno == -2)
                    throw new Exception("Se esta repitiendo el mismo mensaje al mismo destinatario");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        internal List<Usuario> ListaUsuariosReciben(int numIdenti)
        {
            List<Usuario> _lista = new List<Usuario>();
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("ListaDestinatarios", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@numIdenti", numIdenti);

            try
            {
                _cnn.Open();

                SqlDataReader _lector = _comando.ExecuteReader();

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string nomUsu = _lector["NomUsuario"].ToString();

                        Usuario unUsu = PUsuario.GetInstancia().BuscarTodos(nomUsu);

                        _lista.Add(unUsu);
                        
                    }
                }
                _lector.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                _cnn.Close();
            }
            return _lista;
        }
    }
}
