using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class ChargeDetails
    {
        public DataTable SelectChargeDetails()
        {
            DALComponent dalComponent = new DALComponent();
            dalComponent.SqlCommandText = "[SelectChargeDetails]";
            return dalComponent.SelectRecord();
        }

        public DataTable SelectChargeDetailsByID(int chargeId)
        {
            DALComponent dalComponent = new DALComponent();
            dalComponent.SetParameters("@chargeId", SqlDbType.Int, 4, chargeId);
            dalComponent.SqlCommandText = "[SelectChargeDetailsByID]";
            return dalComponent.SelectRecord();
        }

        public int CreateChargeDetails(int chargeId, int userId, string chargeName, int chargeType, double amtorpercent)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();

                dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@chargeId", SqlDbType.Int, 4, chargeId);
                dalComponent.SetParameters("@chargeName", SqlDbType.VarChar, 50, chargeName);
                dalComponent.SetParameters("@chargeType", SqlDbType.Int, 4, chargeType);
                dalComponent.SetParameters("@amtorpercent", SqlDbType.Float,18, amtorpercent);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);
                dalComponent.SqlCommandText = "[CreateChargeDetails]";
                int x = dalComponent.CreateRecord();
                return x;
            }
            catch (Exception)
            {
                throw;
            }
            return 0;
        }

        public void ChargeDetailsDelete(int chargeId)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@chargeId", SqlDbType.Int, 4, chargeId);
                dalComponent.SqlCommandText = "[ChargeDetailsDelete]";
                int x = dalComponent.DeleteRecord();
            }
            catch (Exception)
            {

                throw;
            }
        }


    }
}
