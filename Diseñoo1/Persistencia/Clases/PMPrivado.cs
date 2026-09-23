using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;

namespace Persistencia
{
     internal class PMPrivado : IPersistenciaPrivado
    {
        private static PMPrivado _instancia = null;
        private PMPrivado() { }
        public static PMPrivado GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PMPrivado();
            return _instancia;
        }

        public void AltaMPrivado(MPrivado unMPriv)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaMPrivado", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@asunto", unMPriv.Asunto);
            _comando.Parameters.AddWithValue("@texto", unMPriv.Texto);
            _comando.Parameters.AddWithValue("@nomUsuarioEnvia", unMPriv.UnUsuario.NomUsuario);
            _comando.Parameters.AddWithValue("@fechaCaduca", unMPriv.FechaCaducidad);
            SqlParameter retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(retorno);

            SqlTransaction miTran = null;

            try
            {
                _cnn.Open();

                miTran = _cnn.BeginTransaction();

                _comando.Transaction = miTran;
                _comando.ExecuteNonQuery();

                int numIdenti = Convert.ToInt32(retorno.Value);
                if (numIdenti == -1)
                    throw new Exception("No existe el usuario.");
                else if (numIdenti == -2)
                    throw new Exception("Ocurrió un error.");

                foreach (Usuario usu in unMPriv.ColUsu)
                {
                    var Rec = new PRecibe();
                    Rec.AltaRecibe(usu, numIdenti, miTran);
                }
                miTran.Commit();
            }
            catch (Exception ex)
            {
                miTran.Rollback();
                throw ex;
            }
            finally
            {
                _cnn.Close();
            }
        }
        public List<MPrivado> ListarPrivado()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MPrivado unMP = null;
            List<MPrivado> _lista = new List<MPrivado>();

            SqlCommand _comando = new SqlCommand("ListarPrivado", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                
                Usuario unUsu;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        DateTime fechaCadu = Convert.ToDateTime(_lector["FechaCaducidad"]);
                        string texto = (string)_lector["Texto"];

                        unUsu = PUsuario.GetInstancia().BuscarTodos(nomUsuario);
                      
                        var Rec = new PRecibe();

                        unMP = new MPrivado(asunto, texto, numIdenti, fyhEnvio, unUsu, Rec.ListaUsuariosReciben(numIdenti), fechaCadu);
                        _lista.Add(unMP);
                    }
                }
                _lector.Close();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _lista;
        }
        public List<MPrivado> ListadoBandejaEntrPriv(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MPrivado unMP = null;
            List<MPrivado> _lista = new List<MPrivado>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaEntradaPri", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                
                Usuario unUsua;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        DateTime fechaCadu = Convert.ToDateTime(_lector["FechaCaducidad"]);
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);
                        
                        var Rec = new PRecibe();

                        unMP = new MPrivado(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), fechaCadu);
                        _lista.Add(unMP);
                    }
                }
                _lector.Close();

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _lista;
        }

        public List<MPrivado> ListadoBandejaSalPriv(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MPrivado unMP = null;
            List<MPrivado> _lista = new List<MPrivado>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaSalidaPri", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();

                Usuario unUsua;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        DateTime fechaCadu = Convert.ToDateTime(_lector["FechaCaducidad"]);
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);

                        var Rec = new PRecibe();

                        unMP = new MPrivado(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), fechaCadu);
                        _lista.Add(unMP);
                    }
                }
                _lector.Close();

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _lista;
        }
    }
}
