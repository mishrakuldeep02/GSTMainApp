using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modal
{
    public class PL_ClientProfile
    {


        public int Ind { get; set; }
        public int GspCode { get; set; }
        public int AspCode { get; set; }
        public int StateCode { get; set; }
        public int DistrictCode { get; set; }
        public int CityCode { get; set; }
        public int ClientCode { get; set; }
        public int ClientCodeOdp { get; set; }
        public int ClientType { get; set; }
        public string FirmName { get; set; }
        public string ClientNameE { get; set; }
        public string ClientNameH { get; set; }
        public string ClientDesg { get; set; }
        public string ClientMobileNo1 { get; set; }
        public string ClientMobileNo2 { get; set; }
        public string LandLineNo { get; set; }
        public string EmailId { get; set; }
        public string ClientPANNo { get; set; }
        public string AadhaarNo { get; set; }
        public string AlternateContactName { get; set; }
        public string AlternateMobileNo { get; set; }
        public string AlternateEmailid { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string IFSCCode { get; set; }
        public string AccountNo { get; set; }
        public int DependentInd { get; set; }
        public int CACode { get; set; }
        public int CACodeOdp { get; set; }
        public int ActiveInd { get; set; }
        public string ActiveDate { get; set; }
        public int LoginUserCode { get; set; }
        public string EntryDate { get; set; }
        public int RefnoOtherSys { get; set; }
        public int BussinessNatureId { get; set; }
        public int BussinessTypeId { get; set; }

        public string FullAddress { get; set; }
        public string PinCode { get; set; }
        public int RegNo { get; set; }

        public string GSTINNo { get; set; }

        public string AggrTurnOver       { get; set; }
        public string AggrTurnOverAprJun { get; set; }
        public int CompAppInd         { get; set; }
        public string CompAppDate        { get; set; }
        public int NonResiTaxInd      { get; set; }
        public string NonResFromDate     { get; set; }
        public string NonResToDate       { get; set; }
    }
}
