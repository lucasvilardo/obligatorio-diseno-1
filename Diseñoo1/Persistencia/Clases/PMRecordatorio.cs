using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PMRecordatorio : IPersistenciaRecordatorio
    {
        private static PMRecordatorio _instancia = null;
        private PMRecordatorio() { }
        public static PMRecordatorio GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PMRecordatorio();
            return _instancia;
        }

        public void AltaMRecordatorio(MRecordatorio unMRec)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaMRecordatorio", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@asunto", unMRec.Asunto);
            _comando.Parameters.AddWithValue("@texto", unMRec.Texto);
            _comando.Parameters.AddWithValue("@nomUsuarioEnvia", unMRec.UnUsuario.NomUsuario);
            _comando.Parameters.AddWithValue("@tipoRecordatorio", unMRec.TipoRecordatorio);
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

                foreach (Usuario usu in unMRec.ColUsu)
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
        public List<MRecordatorio> ListarRecordatorio()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MRecordatorio unMR = null;
            List<MRecordatorio> _lista = new List<MRecordatorio>();

            SqlCommand _comando = new SqlCommand("ListarRecordatorio", _cnn);
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
                        string tipoRec = (string)_lector["TipoRecordatorio"];
                        string texto = (string)_lector["Texto"];

                        unUsu = PUsuario.GetInstancia().BuscarTodos(nomUsuario);

                        var Rec = new PRecibe();

                        unMR = new MRecordatorio(asunto, texto, numIdenti, fyhEnvio, unUsu, Rec.ListaUsuariosReciben(numIdenti), tipoRec);
                        _lista.Add(unMR);
                    }
                }

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

        public List<MRecordatorio> ListadoBandejaEntrRec(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MRecordatorio unMR = null;
            List<MRecordatorio> _lista = new List<MRecordatorio>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaEntradaRec", _cnn);
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
                        string tipoPrese = (string)_lector["TipoRecordatorio"];
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);

                        var Rec = new PRecibe();

                        unMR = new MRecordatorio(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), tipoPrese);
                        _lista.Add(unMR);
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

        public List<MRecordatorio> ListadoBandejaSalRec(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MRecordatorio unMR = null;
            List<MRecordatorio> _lista = new List<MRecordatorio>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaSalidaRec", _cnn);
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
                        string tipoPrese = (string)_lector["TipoRecordatorio"];
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);

                        var Rec = new PRecibe();

                        unMR = new MRecordatorio(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), tipoPrese);
                        _lista.Add(unMR);
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
