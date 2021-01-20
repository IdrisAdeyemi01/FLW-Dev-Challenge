final allBanksList = [
  {"id": 132, "code": "560", "name": "Page MFBank"},
  {"id": 133, "code": "304", "name": "Stanbic Mobile Money"},
  {"id": 134, "code": "308", "name": "FortisMobile"},
  {"id": 135, "code": "328", "name": "TagPay"},
  {"id": 136, "code": "309", "name": "FBNMobile"},
  {"id": 137, "code": "011", "name": "First Bank of Nigeria"},
  {"id": 138, "code": "326", "name": "Sterling Mobile"},
  {"id": 139, "code": "990", "name": "Omoluabi Mortgage Bank"},
  {"id": 140, "code": "311", "name": "ReadyCash (Parkway)"},
  {"id": 141, "code": "057", "name": "Zenith Bank"},
  {"id": 142, "code": "068", "name": "Standard Chartered Bank"},
  {"id": 143, "code": "306", "name": "eTranzact"},
  {"id": 144, "code": "070", "name": "Fidelity Bank"},
  {"id": 145, "code": "023", "name": "CitiBank"},
  {"id": 146, "code": "215", "name": "Unity Bank"},
  {"id": 147, "code": "323", "name": "Access Money"},
  {"id": 148, "code": "302", "name": "Eartholeum"},
  {"id": 149, "code": "324", "name": "Hedonmark"},
  {"id": 150, "code": "325", "name": "MoneyBox"},
  {"id": 151, "code": "301", "name": "JAIZ Bank"},
  {"id": 152, "code": "050", "name": "Ecobank Plc"},
  {"id": 153, "code": "307", "name": "EcoMobile"},
  {"id": 154, "code": "318", "name": "Fidelity Mobile"},
  {"id": 155, "code": "319", "name": "TeasyMobile"},
  {"id": 156, "code": "999", "name": "NIP Virtual Bank"},
  {"id": 157, "code": "320", "name": "VTNetworks"},
  {"id": 158, "code": "221", "name": "Stanbic IBTC Bank"},
  {"id": 159, "code": "501", "name": "Fortis Microfinance Bank"},
  {"id": 160, "code": "329", "name": "PayAttitude Online"},
  {"id": 161, "code": "322", "name": "ZenithMobile"},
  {"id": 162, "code": "303", "name": "ChamsMobile"},
  {"id": 163, "code": "403", "name": "SafeTrust Mortgage Bank"},
  {"id": 164, "code": "551", "name": "Covenant Microfinance Bank"},
  {"id": 165, "code": "415", "name": "Imperial Homes Mortgage Bank"},
  {"id": 166, "code": "552", "name": "NPF MicroFinance Bank"},
  {"id": 167, "code": "526", "name": "Parralex"},
  {"id": 168, "code": "035", "name": "Wema Bank"},
  {"id": 169, "code": "084", "name": "Enterprise Bank"},
  {"id": 170, "code": "063", "name": "Diamond Bank"},
  {"id": 171, "code": "305", "name": "Paycom"},
  {"id": 172, "code": "100", "name": "SunTrust Bank"},
  {"id": 173, "code": "317", "name": "Cellulant"},
  {"id": 174, "code": "401", "name": "ASO Savings and & Loans"},
  {"id": 175, "code": "030", "name": "Heritage"},
  {"id": 176, "code": "402", "name": "Jubilee Life Mortgage Bank"},
  {"id": 177, "code": "058", "name": "GTBank Plc"},
  {"id": 178, "code": "032", "name": "Union Bank"},
  {"id": 179, "code": "232", "name": "Sterling Bank"},
  {"id": 180, "code": "076", "name": "Skye Bank"},
  {"id": 181, "code": "082", "name": "Keystone Bank"},
  {"id": 182, "code": "327", "name": "Pagatech"},
  {"id": 183, "code": "559", "name": "Coronation Merchant Bank"},
  {"id": 184, "code": "601", "name": "FSDH"},
  {"id": 185, "code": "313", "name": "Mkudi"},
  {"id": 186, "code": "214", "name": "First City Monument Bank"},
  {"id": 187, "code": "314", "name": "FET"},
  {"id": 188, "code": "523", "name": "Trustbond"},
  {"id": 189, "code": "315", "name": "GTMobile"},
  {"id": 190, "code": "033", "name": "United Bank for Africa"},
  {"id": 191, "code": "044", "name": "Access Bank"},
  {"id": 567, "code": "90115", "name": "TCF MFB"}
];

List<String> fetchBanksList() {
  List<String> allBanks = [];
  for (var i in allBanksList) {
    allBanks.add(i['name']);
  }
  return allBanks;
}

List<String> fetchBanksCodes() {
  List<String> allBanksCode = [];
  for (var i in allBanksList) {
    allBanksCode.add(i['code']);
  }
  return allBanksCode;
}
