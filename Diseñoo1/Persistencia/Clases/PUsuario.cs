using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;
using System.Data;

namespace Persistencia
{
    internal class PUsuario : IPersistenciaUsuario
    {
        private static PUsuario _instancia = null;
        private PUsuario() { }
        public static PUsuario GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PUsuario();
            return _instancia;
        }

        public Usuario Logueo(string Usu, string Contra)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Usuario unUsu = null;

            SqlCommand _comando = new SqlCommand("LogueoUsuario", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", Usu);
            _comando.Parameters.AddWithValue("@contra", Contra);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();

                    string nomUsuario = (string)_lector["NomUsuario"];
                    string mail = (string)_lector["Mail"];
                    DateTime fechaNac = (DateTime)_lector["FechaNacimiento"];
                    string nomCompleto = (string)_lector["NomCompleto"];
                    string contra = (string)_lector["Contraseña"];


                    unUsu = new Usuario(nomUsuario, mail, nomCompleto, contra, fechaNac);
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
            return unUsu;
        }

        public void AltaUsuario(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaUsuario", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);
            _comando.Parameters.AddWithValue("@nomCompleto", unUsu.NomCompleto);
            _comando.Parameters.AddWithValue("@contra", unUsu.Contraseña);
            _comando.Parameters.AddWithValue("@mail", unUsu.Mail);
            _comando.Parameters.AddWithValue("@fecha", unUsu.FechaNacimiento);

            SqlParameter _ParmRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _ParmRetorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_ParmRetorno);

            try
            {

                _cnn.Open();
                _comando.ExecuteNonQuery();

                int _retorno = Convert.ToInt32(_ParmRetorno.Value);
                if (_retorno == -1)
                    throw new Exception("El usuario ya existe!");

            }
            catch (Exception ex)
            {
                
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }

        public void BajaUsuario(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("BajaUsuario", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();

                if ((int)_retorno.Value == -1)
                    throw new Exception("No existe el usuario.");
                if ((int)_retorno.Value == -2)
                    throw new Exception("Ocurrió un error en la baja.");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }

        public void ModificarContra(Usuario unUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("ModificarContra", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", unUsu.NomUsuario);
            _comando.Parameters.AddWithValue("@contraNueva", unUsu.Contraseña);
            

            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();

                int retorno = (int)_retorno.Value;

                if (retorno == -1)
                    throw new Exception("El usuario no existe o no esta activo.");
                else if (retorno == -2)
                    throw new Exception("El ingreso de la contraseña nueva no coincide.");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }

        public EC.Usuario Buscar(string nomUsuario)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Usuario unUsu = null;

            SqlCommand _comando = new SqlCommand("UsuarioBuscar", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", nomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    string nomUsu = (string)_lector["NomUsuario"];
                    string nomCompleto = (string)_lector["NomCompleto"];
                    string mail = (string)_lector["Mail"];
                    string contra = (string)_lector["Contraseña"];
                    DateTime fechaNac = (DateTime)_lector["FechaNacimiento"];

                    unUsu = new Usuario(nomUsu, mail, nomCompleto, contra, fechaNac);
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
            return unUsu;
        }

        internal EC.Usuario BuscarTodos(string nomUsuario)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Usuario unUsu = null;

            SqlCommand _comando = new SqlCommand("UsuarioBuscarActivos", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@nomUsuario", nomUsuario);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    string nomUsu = (string)_lector["NomUsuario"];
                    string nomCompleto = (string)_lector["NomCompleto"];
                    string mail = (string)_lector["Mail"];
                    string contra = (string)_lector["Contraseña"];
                    DateTime fechaNac = (DateTime)_lector["FechaNacimiento"];

                    unUsu = new Usuario(nomUsu, mail, nomCompleto, contra, fechaNac);
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
            return unUsu;
        }
        public List<EC.Usuario> ListadoUsuariosAct()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Usuario unUsu = null;
            List<Usuario> _lista = new List<Usuario>();

            SqlCommand _comando = new SqlCommand("ListadoUsuActivos", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string nomUsu = (string)_lector["NomUsuario"];
                        string nomCompleto = (string)_lector["NomCompleto"];
                        string mail = (string)_lector["Mail"];
                        string contra = (string)_lector["Contraseña"];
                        DateTime fechaNac = (DateTime)_lector["FechaNacimiento"];

                        unUsu = new Usuario(nomUsu, mail, nomCompleto, contra, fechaNac);

                        _lista.Add(unUsu);
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


    }
}
