enum Validate {
  phone,
  email,
  password,
  bankAccountNumber,
  date,
  none,
  noneOrNotNull,
  noneOrPhone,
  noneOrEmail,
  rePassword,
  notNull,
  ifValidnumber,
  ifValidWebsite,
  ifValidEmail,
  ifValidDate,
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

enum SlideDirection { left, right, top, bottom }
