using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YardeCart.Data;
using YardeCart.Entity;
using System.Data;
using YardeCart.Common;

namespace YardeCart.Business
{
    public class UserInfoBll
    {
        DALComponent dalComponent = null;

        public UserInfoBll()
        {
            dalComponent = new DALComponent();
        }

        #region .. USER REGISTER ..
        
        public int CreateUserInfo(UserProfile userDo)
        {

            try
            {

                dalComponent.SetParameters("@UserId", SqlDbType.Int, 4, userDo.UserId);
                dalComponent.SetParameters("@UserName", SqlDbType.VarChar, 100, userDo.UserName);
                dalComponent.SetParameters("@FirstName", SqlDbType.VarChar, 100, userDo.FirstName);
                dalComponent.SetParameters("@LastName", SqlDbType.VarChar, 100, userDo.LastName);
                dalComponent.SetParameters("@Gender", SqlDbType.Int, 4, userDo.Gender);
                dalComponent.SetParameters("@UserPassword", SqlDbType.VarChar, 50, userDo.UserPasswrod);
                dalComponent.SetParameters("@Email", SqlDbType.VarChar, 50, userDo.Email);
                dalComponent.SetParameters("@Mobile", SqlDbType.VarChar, 50, userDo.Mobile);
                dalComponent.SetParameters("@Address", SqlDbType.VarChar, 100, userDo.Address);
                dalComponent.SetParameters("@StreetName", SqlDbType.VarChar, 50, userDo.StreetName);
                dalComponent.SetParameters("@CityId", SqlDbType.Int, 4, userDo.CityId);
                dalComponent.SetParameters("@StateId", SqlDbType.Int, 4, userDo.StateId);
                dalComponent.SetParameters("@CountryId", SqlDbType.Int, 4, userDo.CountryId);
                dalComponent.SetParameters("@ZipCode", SqlDbType.VarChar, 50, userDo.ZipCode);
                dalComponent.SetParameters("@idvalue", SqlDbType.Int, true);
                dalComponent.SqlCommandText = "CreateUser";
                int x = dalComponent.CreateRecord();
                object y = dalComponent.GetParameters("@idvalue");
                if (userDo.UserId != 0)
                    return userDo.UserId;
                else
                    return Int32.Parse(y.ToString());
            }
            catch (System.Data.SqlClient.SqlException sqlEx)
            {
                throw;
            }
            catch (Exception ex)
            {

                throw;
            }

        }
        
        #endregion

        public DataTable GetUserName(int userId)
        {
            dalComponent.SetParameters("@UserId", SqlDbType.Int, 4, userId);
            dalComponent.SqlCommandText = "UserNameGet";
            return dalComponent.SelectRecord();
        }

        public DataTable GetUserByEmail(string strEmailId, string strQues, string strAns)
        {
            dalComponent.SetParameters("@mail", SqlDbType.VarChar, 50, strEmailId);
            dalComponent.SetParameters("@ques", SqlDbType.VarChar, 50, strQues);
            dalComponent.SetParameters("@ans", SqlDbType.VarChar, 50, strAns);
            dalComponent.SqlCommandText = "GetUserByEmail";
            return dalComponent.SelectRecord();
        }

        #region .. GET USER PROFILE ..

        public UserProfile UserProfile(int userId)
        {
            try
            {

                DataTable dt = new DataTable();
                UserProfile userProfile = new UserProfile();
                dalComponent.SetParameters("@userId", SqlDbType.Int, 4, userId);
                dalComponent.SqlCommandText = "SelectProfile";
                dt = dalComponent.SelectRecord();
                if (dt.Rows.Count > 0)
                {
                    userProfile.UserId = (int)dt.Rows[0]["UserId"];
                    userProfile.FirstName = dt.Rows[0]["firstName"].ToString();
                    userProfile.LastName = dt.Rows[0]["lastName"].ToString();
                    userProfile.Address = dt.Rows[0]["email"].ToString();
                    userProfile.UserName = dt.Rows[0]["userName"].ToString();
                    userProfile.UserPasswrod = dt.Rows[0]["UserPassword"].ToString();

                    return userProfile;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return null;
        }

        public DataTable SelectAllProfile()
        {
            try
            {
                DataTable dt = new DataTable();
                UserProfile userProfile = new UserProfile();
                dalComponent.SqlCommandText = "SelectAllProfile";
                return dt = dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        #endregion

        #region .. FOR LOGIN, VALIDATE USERNAME & PASSWORD ..

        public int ValidateAdmin(string AdminName, string AdminPassword)
        {
            try
            {
                dalComponent.SetParameters("@adminName", SqlDbType.VarChar, 50, AdminName);
                dalComponent.SetParameters("@adminPassword", SqlDbType.VarChar, 50, AdminPassword);
                dalComponent.SqlCommandText = "ValidateAdmin";
                object y = dalComponent.SelectRecordValue();
                if (int.Parse(y.ToString()) > 0)
                    return int.Parse(y.ToString());
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw;
            }

            return 0;
        }

        #endregion

        #region .. FOR LOGIN, VALIDATE USERNAME & PASSWORD ..

        public int ValidateUser(string userName, string userPassword)
        {
            try
            {
                dalComponent.SetParameters("@Username", SqlDbType.VarChar, 50, userName);
                dalComponent.SetParameters("@UserPassword", SqlDbType.VarChar, 50, userPassword);
                dalComponent.SqlCommandText = "ValidateUser";
                object y = dalComponent.SelectRecordValue();
                if (int.Parse(y.ToString()) > 0)
                    return int.Parse(y.ToString());
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw;
            }

            return 0;
        }

        #endregion

        #region .. FOR CHECK USERNAME & EMAIL ..

        public DataTable AvailableUser(string userName)
        {
            try
            {
                dalComponent.SetParameters("@Username", SqlDbType.VarChar, 50, userName);
                dalComponent.SqlCommandText = "AvailableUser";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable AvailableMail(string Email)
        {
            try
            {
                dalComponent.SetParameters("@email", SqlDbType.VarChar, 50, Email);
                dalComponent.SqlCommandText = "AvailableMail";
                return dalComponent.SelectRecord();
                //object y = dalComponent.SelectRecordValue();
                //if (int.Parse(y.ToString()) > 0)
                //    return int.Parse(y.ToString());
                //else
                //    return 0;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        #endregion

        public void UpdateUserDeleteStatus(int userId, int delVal)
        {
            try
            {
                dalComponent.SetParameters("@userid", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@delvalue", SqlDbType.Int, 4, delVal);
                dalComponent.SqlCommandText = "UpdateUserDeleteStatus";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void UpdateUserBlockStatus(int userId, int blockVal)
        {
            try
            {
                dalComponent.SetParameters("@userid", SqlDbType.Int, 4, userId);
                dalComponent.SetParameters("@blockvalue", SqlDbType.Int, 4, blockVal);
                dalComponent.SqlCommandText = "UpdateUserBlockStatus";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void UpdateActivation(int userId)
        {
            try
            {
                dalComponent.SetParameters("@userid", SqlDbType.Int, 4, userId);
                dalComponent.SqlCommandText = "UpdateActivation";
                int x = dalComponent.CreateRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable SelectProfile(int userId)
        {
            try
            {
                dalComponent.SetParameters("@userid", SqlDbType.Int, 4, userId);
                dalComponent.SqlCommandText = "SelectProfile";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable SearchUsers(string Keyword)
        {
            try
            {
                dalComponent = new DALComponent();
                dalComponent.SetParameters("@Keyword", SqlDbType.VarChar, 200, Keyword);
                dalComponent.SqlCommandText = "SearchUsers";
                return dalComponent.SelectRecord();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}