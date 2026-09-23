using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PMComun : IPersistenciaComun
    {
        private static PMComun _instancia = null;
        private PMComun() { }
        public static PMComun GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PMComun();
            return _instancia;
        }

        public void AltaMComun(MComun unMCom)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaMComun", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@asunto", unMCom.Asunto);
            _comando.Parameters.AddWithValue("@texto", unMCom.Texto);
            _comando.Parameters.AddWithValue("@nomUsuarioEnvia", unMCom.UnUsuario.NomUsuario);
            _comando.Parameters.AddWithValue("@codCat", unMCom.UnaCate.CodCat);
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
                    throw new Exception("No existe la categoría.");
                else if (numIdenti == -2)
                    throw new Exception("No existe el usuario.");
                else if (numIdenti == -3)
                    throw new Exception("Ocurrió un error.");

                foreach (Usuario usu in unMCom.ColUsu)
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

        public List<MComun> ListadoBandejaEntrCom(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MComun unMC = null;
            List<MComun> _lista = new List<MComun>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaEntradaCom", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                Categoria unaCate;
                Usuario unUsua;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        String codCat = (string)_lector["CodCat"];
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);
                        unaCate = PCategoria.GetInstancia().Buscar(codCat);
                        var Rec = new PRecibe();

                        unMC = new MComun(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), unaCate);
                        _lista.Add(unMC);
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

        public List<MComun> ListadoBandejaSalCom(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MComun unMC = null;
            List<MComun> _lista = new List<MComun>();

            SqlCommand _comando = new SqlCommand("ListadoBandejaSalidaCom", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                Categoria unaCate;
                Usuario unUsua;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        String codCat = (string)_lector["CodCat"];
                        string texto = (string)_lector["Texto"];

                        unUsua = PUsuario.GetInstancia().BuscarTodos(nomUsuario);
                        unaCate = PCategoria.GetInstancia().Buscar(codCat);
                        var Rec = new PRecibe();

                        unMC = new MComun(asunto, texto, numIdenti, fyhEnvio, unUsua, Rec.ListaUsuariosReciben(numIdenti), unaCate);
                        _lista.Add(unMC);
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

        public List<MComun> ListarComun()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            MComun unMC = null;
            List<MComun> _lista = new List<MComun>();

            SqlCommand _comando = new SqlCommand("ListarComun", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            
            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                Categoria unaCate;
                Usuario unUsu;

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string asunto = (string)_lector["Asunto"];
                        string nomUsuario = (string)_lector["NomUsuario"];
                        DateTime fyhEnvio = Convert.ToDateTime(_lector["FyHEnvio"]);
                        int numIdenti = (int)_lector["NumIdenti"];
                        String codCat = (string)_lector["CodCat"];
                        string texto = (string)_lector["Texto"];

                         unUsu = PUsuario.GetInstancia().BuscarTodos(nomUsuario);
                         unaCate = PCategoria.GetInstancia().Buscar(codCat);
                        var Rec = new PRecibe();

                        unMC = new MComun(asunto, texto, numIdenti, fyhEnvio, unUsu, Rec.ListaUsuariosReciben(numIdenti), unaCate);
                        _lista.Add(unMC);
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
