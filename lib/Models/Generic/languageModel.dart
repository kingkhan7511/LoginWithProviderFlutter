class LanguagesModel {
  int id;
  String code;
  String name;
  String nativeName;

  LanguagesModel(this.id, this.code, this.name, this.nativeName);
  
  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'nativeName': nativeName,
      };
      
  LanguagesModel.fromJson(obj) {
    this.id = obj['id'];
    this.code = obj['code'];
    this.name = obj['name'];
    this.nativeName = obj['nativeName'];
  }
  static List<LanguagesModel> fromJsonList(jsonList) {
    return jsonList != null
        ? jsonList
            .map<LanguagesModel>((obj) => LanguagesModel.fromJson(obj))
            .toList()
        : new List<LanguagesModel>();
  }
}

//List<int> rtlLanguagesList = [2,125,57,170];

List<Map<String, dynamic>> allLanguages = [
  {"id": 1, "code": "af", "name": "Afrikaans", "nativeName": "Afrikaans"},
  {"id": 2, "code": "ar", "name": "Arabic", "nativeName": "العربية"},
  // {"id": 8, "code": "am", "name": "Amharic", "nativeName": "አማርኛ"},
  // {"id": 20, "code": "bn", "name": "Bengali", "nativeName": "বাংলা"},
  // {"id": 25, "code": "bg", "name": "Bulgarian", "nativeName": "български език"},
  {"id": 3, "code": "zh", "name": "Chinese", "nativeName": "中文"},
  // {"id": 36, "code": "hr", "name": "Croatian", "nativeName": "hrvatski"},
  // {"id": 37, "code": "cs", "name": "Czech", "nativeName": "čeština"},
  // {"id": 38, "code": "da", "name": "Danish", "nativeName": "dansk"},
  // {"id": 40, "code": "nl", "name": "Dutch", "nativeName": "Nederlands"},
  {"id": 4, "code": "en", "name": "English", "nativeName": "UK"},
  // {"id": 46, "code": "fi", "name": "Finnish", "nativeName": "suomi"},
  {"id": 5, "code": "fr", "name": "French", "nativeName": "français"},
  // {"id": 50, "code": "ka", "name": "Georgian", "nativeName": "ქართული"},
  {"id": 6, "code": "de", "name": "German", "nativeName": "Deutsch"},
  // {"id": 52, "code": "el", "name": "Greek", "nativeName": "Ελληνικά"},
  {"id": 7, "code": "he", "name": "Hebrew", "nativeName": "עברית"},
  {"id": 8, "code": "hi", "name": "Hindi", "nativeName": "हिन्दी"},
  // {"id": 61, "code": "hu", "name": "Hungarian", "nativeName": "Magyar"},
  // {
  //   "id": 63,
  //   "code": "id",
  //   "name": "Indonesian",
  //   "nativeName": "Bahasa Indonesia"
  // },
  // {"id": 70, "code": "it", "name": "Italian", "nativeName": "Italiano"},
  {"id": 9, "code": "ja", "name": "Japanese", "nativeName": "日本語"},
  // {"id": 73, "code": "jv", "name": "Javanese", "nativeName": "basa Jawa"},
  // {"id": 85, "code": "ko", "name": "Korean", "nativeName": "한국어"},
  // {"id": 96, "code": "lv", "name": "Latvian", "nativeName": "latviešu"},
  // {"id": 100, "code": "ms", "name": "Malay", "nativeName": "bahasa Melayu‎"},
  // {"id": 101, "code": "ml", "name": "Malayalam", "nativeName": "മലയാളം"},
  // {"id": 102, "code": "mt", "name": "Maltese", "nativeName": "Malti"},
  // {"id": 104, "code": "mr", "name": "Marathi", "nativeName": "मराठी"},
  // {"id": 111, "code": "ne", "name": "Nepali", "nativeName": "नेपाली"},
  // {"id": 114, "code": "no", "name": "Norwegian", "nativeName": "Norsk"},
  // {"id": 123, "code": "pa", "name": "Punjabi", "nativeName": "ਪੰਜਾਬੀ"},
  // {"id": 125, "code": "fa", "name": "Persian", "nativeName": "فارسی"},
  // {"id": 126, "code": "pl", "name": "Polish", "nativeName": "polski"},
  // {"id": 128, "code": "pt", "name": "Portuguese", "nativeName": "Português"},
  // {"id": 132, "code": "ro", "name": "Romanian", "nativeName": "română"},
  {"id": 10, "code": "ru", "name": "Russian", "nativeName": "русский"},
  // {"id": 140, "code": "sr", "name": "Serbian", "nativeName": "српски"},
  // {"id": 144, "code": "sk", "name": "Slovak", "nativeName": "slovenčina"},
  // {"id": 145, "code": "sl", "name": "Slovene", "nativeName": "slovenščina"},
  {"id": 11, "code": "es", "name": "Spanish", "nativeName": "español"},
  // {"id": 150, "code": "sw", "name": "Swahili", "nativeName": "Kiswahili"},
  // {"id": 152, "code": "sv", "name": "Swedish", "nativeName": "svenska"},
  // {"id": 153, "code": "ta", "name": "Tamil", "nativeName": "தமிழ்"},
  // {"id": 154, "code": "te", "name": "Telugu", "nativeName": "తెలుగు"},
  // {"id": 156, "code": "th", "name": "Thai", "nativeName": "ไทย"},
  // {"id": 157, "code": "ti", "name": "Tigrinya", "nativeName": "ትግርኛ"},
  // {"id": 163, "code": "tr", "name": "Turkish", "nativeName": "Türkçe"},
  {"id": 12, "code": "uk", "name": "Ukrainian", "nativeName": "українська"},
  // {"id": 170, "code": "ur", "name": "Urdu", "nativeName": "اردو"},
  // {"id": 173, "code": "vi", "name": "Vietnamese", "nativeName": "Tiếng Việt"},
  // {"id": 181, "code": "yo", "name": "Yoruba", "nativeName": "Yorùbá"},
];
