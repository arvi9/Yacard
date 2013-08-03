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

        public DataTable SelectMaxID()
        {
            DALComponent dalComponent = new DALComponent();
            dalComponent.SqlCommandText = "SelectMaxID";
            return dalComponent.SelectRecord();
        }

        public void CreateBuyDetails(int adpostId, int historyId, int userId, decimal totalprice, int delitype, int cityId,
            string currentstatus, int viewcount, string chargeName, int chargeType, double chargeAmount)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@historyId", SqlDbType.Int, 4, historyId);
                dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@totalprice", SqlDbType.Decimal, 9, totalprice);
                dalComponent.SetParameters("@delitype", SqlDbType.Int, 4, delitype);
                dalComponent.SetParameters("@cityId", SqlDbType.Int, 4, cityId);
                dalComponent.SetParameters("@currentstatus", SqlDbType.VarChar, 50, currentstatus);
                dalComponent.SetParameters("@viewcount", SqlDbType.Int, 4, viewcount);
                dalComponent.SetParameters("@chargeName", SqlDbType.VarChar, 50, chargeName);
                dalComponent.SetParameters("@chargeType", SqlDbType.Int, 4, chargeType);
                dalComponent.SetParameters("@chargeAmount", SqlDbType.Float, 9, chargeAmount);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);

                dalComponent.SqlCommandText = "[CreateBuyDetails]";
                int x = dalComponent.CreateRecord();

                object y = dalComponent.GetParameters("@idvalue");
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void UpdateCartStatus(int adpostId, int userid)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@adpostid", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@userid", SqlDbType.Int, 4, userid);
                dalComponent.SqlCommandText = "[UpdateCartStatus]";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
