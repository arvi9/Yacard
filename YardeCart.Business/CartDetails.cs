using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class CartDetails
    {
        public DataTable SelectUserCartDetails(int userId)
        {
            DALComponent dalComponent = new DALComponent();
            dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
            dalComponent.SqlCommandText = "SelectUserCartDetails";
            return dalComponent.SelectRecord();
        }

        public void CreateUserCart(int cartId, int userId, int adpostId)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@cartId", SqlDbType.Int, 4, cartId);
                dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);

                dalComponent.SqlCommandText = "CreateUserCart";
                int x = dalComponent.CreateRecord();

                object y = dalComponent.GetParameters("@idvalue");
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void CartDetailDelete(int cartid)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@cartid", SqlDbType.Int, 4, cartid);
                dalComponent.SqlCommandText = "CartDetailDelete";
                int x = dalComponent.DeleteRecord();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
