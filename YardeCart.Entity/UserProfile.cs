using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YardeCart.Entity
{
    public class UserProfile
    {

        private int userId;
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        private string userName;
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private string firstName;
        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        private string lastName;
        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }

        private int gender;
        public int Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        private string userPassword;
        public string UserPassword
        {
            get { return userPassword; }
            set { userPassword = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string mobile;
        public string Mobile
        {
            get { return mobile; }
            set { mobile = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        private string streetName;
        public string StreetName
        {
            get { return streetName; }
            set { streetName = value; }
        }

        private int cityId;
        public int CityId
        {
            get { return cityId; }
            set { cityId = value; }
        }

        private int stateId;
        public int StateId
        {
            get { return stateId; }
            set { stateId = value; }
        }

        private int countryId;
        public int CountryId
        {
            get { return countryId; }
            set { countryId = value; }
        }

        private string zipCode;
        public string ZipCode
        {
            get { return zipCode; }
            set { zipCode = value; }
        }

    }
}
