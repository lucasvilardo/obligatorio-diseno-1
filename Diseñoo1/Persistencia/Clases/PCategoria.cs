using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PCategoria : IPersistenciaCategoria
    {
        private static PCategoria _instancia = null;
        private PCategoria() { }
        public static PCategoria GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PCategoria();
            return _instancia;
        }

        public Categoria Buscar(string codCat)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Categoria unaCat = null;

            SqlCommand _comando = new SqlCommand("BuscarCategorias", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodCat", codCat);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();

                if (_lector.HasRows)
                {
                    _lector.Read();

                    string codCate = (string)_lector["CodCat"];
                    string nomCate = (string)_lector["NomCat"];
                    unaCat = new Categoria(codCate, nomCate);
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
            return unaCat;

        }
        public List<Categoria> ListarCategorias()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Categoria unaCate = null;
            List<Categoria> _lista = new List<Categoria>();

            SqlCommand _comando = new SqlCommand("ListarCategorias", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        string codCate = (string)_lector["CodCat"];
                        string nomCate = (string)_lector["NomCat"];
                        unaCate = new Categoria(codCate, nomCate);
                        _lista.Add(unaCate);
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
