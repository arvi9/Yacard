using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class AdDetailsBll
    {
        DALComponent dalComponent = null;
        public AdDetailsBll()
        {
            dalComponent = new DALComponent();
        }

        public int CreateAdPost(int adpostId, string adpostTitle, string description, string keywords, int userId, int categoryId, decimal price,
            int stateId, int cityId, int countryId, string zipCode, DateTime adtillDate, string adStatus, int paidStatus)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@adpostTitle", SqlDbType.VarChar, 500, adpostTitle);
                dalComponent.SetParameters("@description", SqlDbType.VarChar, 1000, description);
                dalComponent.SetParameters("@keywords", SqlDbType.VarChar, 1000, keywords);
                dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@categoryId", SqlDbType.Int, 4, categoryId);
                dalComponent.SetParameters("@price", SqlDbType.Decimal, 9, price);
                dalComponent.SetParameters("@stateId", SqlDbType.Int, 4, stateId);
                dalComponent.SetParameters("@cityId", SqlDbType.Int, 4, cityId);
                dalComponent.SetParameters("@countryId", SqlDbType.Int, 4, countryId);
                dalComponent.SetParameters("@zipCode", SqlDbType.VarChar, 50, zipCode);
                dalComponent.SetParameters("@adtillDate", SqlDbType.SmallDateTime, 4, adtillDate);
                dalComponent.SetParameters("@adStatus", SqlDbType.VarChar, 50, adStatus);
                dalComponent.SetParameters("@paidStatus", SqlDbType.Int, 4, paidStatus);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);

                dalComponent.SqlCommandText = "CreateAdPost";
                int x = dalComponent.CreateRecord();

                object y = dalComponent.GetParameters("@idvalue");
                int adpost_id = Int32.Parse(y.ToString());

                return adpost_id;


            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void CreateAdImageDetails(int imageId, int adpostId, string imagePath, string videoLink)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@imageId", SqlDbType.Int, 4, imageId);
                dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@imagePath", SqlDbType.VarChar, 1000, imagePath);
                dalComponent.SetParameters("@videoLink", SqlDbType.VarChar, 1000, videoLink);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);

                dalComponent.SqlCommandText = "CreateAdImageDetails";
                int x = dalComponent.CreateRecord();

                object y = dalComponent.GetParameters("@idvalue");
                int adpost_id = Int32.Parse(y.ToString());

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable GetAdDetails(int adpostId, int userId)
        {
            dalComponent = new DALComponent();
            dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
            dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
            dalComponent.SqlCommandText = "[GetAdDetails]";
            return dalComponent.SelectRecord();
        }

        public DataTable GetAdImageDetails(int adpostId, int userId)
        {
            dalComponent = new DALComponent();
            dalComponent.SetParameters("@adpostId", SqlDbType.Int, 4, adpostId);
            dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
            dalComponent.SqlCommandText = "[GetAdImageDetails]";
            return dalComponent.SelectRecord();
        }

        public DataTable GetAllAdDetails()
        {
            dalComponent = new DALComponent();
            dalComponent.SqlCommandText = "[GetAllAdDetails]";
            return dalComponent.SelectRecord();
        }

        public void UpdateAdDeleteStatus(int adpostId, int delVal)
        {
            try
            {
                dalComponent.SetParameters("@adpostid", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@delvalue", SqlDbType.Int, 4, delVal);
                dalComponent.SqlCommandText = "UpdateAdDeleteStatus";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void UpdateAdBlockStatus(int adpostId, int blockVal)
        {
            try
            {
                dalComponent.SetParameters("@adpostid", SqlDbType.Int, 4, adpostId);
                dalComponent.SetParameters("@blockvalue", SqlDbType.Int, 4, blockVal);
                dalComponent.SqlCommandText = "UpdateAdBlockStatus";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable SearchAdsByAdtitle(string Keyword)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@Keyword", SqlDbType.VarChar, 200, Keyword);
                dalComponent.SqlCommandText = "SearchAdsByAdtitle";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable SearchAdsByUsername(string Keyword)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@Keyword", SqlDbType.VarChar, 200, Keyword);
                dalComponent.SqlCommandText = "SearchAdsByUsername";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable SearchAdsByKeyword(string Keyword)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@Keyword", SqlDbType.VarChar, 200, Keyword);
                dalComponent.SqlCommandText = "SearchAdsByKeyword";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
