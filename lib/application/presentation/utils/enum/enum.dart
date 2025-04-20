enum Validate {
  phone,
  email,
  password,
  none,
  noneOrNotNull,
  noneOrPhone,
  noneOrEmail,
  rePassword,
  notNull,
  ifValidnumber,
  ifValidWebsite,
  ifValidEmail,
  notNullAndLength10
}

enum Service {
  egAcademy,
  egStudAbroad,
  egJobs,
  egScholarship,
  egPathways,
  eGCareer,
  egIdeaStation,
  egAccomodation,
  egTransportation,
  egLibrary,
  egWorkshop,
  lMS
}

enum InternetConnectionStatus { connected, disconnected, loading }

//enum ServiceDesignType { Expandable, Container, Banner, Gallery, Slider }

enum LMSCourseCardDesign { fromTutorCourse, fromCombletedCourse }
