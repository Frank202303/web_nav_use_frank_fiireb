/// Unified management of strings used multiple times in the app
/// use:
/// name = HAStrings.notificationScreen
class HAStrings {
  //TODO
  // common URL
  static const stagingApiURL = 'https://staging.herblackbook.com/api';
  static const productionApiURL = 'https://app.***.com/api';
  static const faqURL = 'https://www.***.com/pages/faq';
  static const privacyPolicyURL = 'https://www.***.com/pages/privacy-policy';
  static const termAndConditionURL =
      'https://www.***.com/pages/terms-and-conditions';

  //user
  static String statusActive = 'active';
  static String cancel = 'cancel';
  static String no = 'no';
  static String ok = 'ok';
  static String yes = 'yes';
  static String firstName = 'First name';
  static String middleName = 'Middle name(optional)';
  static String lastName = 'Last name';
  static String guest = 'guest';
  static String guests = 'guests';
  static String mobileNumber = 'Mobile number';
  static String dateOfBirthChild = 'Date of birth (Child 2-11)';
  static String dateOfBirthInfant = 'Date of birth (Under 2 years)';
  static String specificServiceRequest = 'Specific service request';

  // Special service request
  // Mobility equipment
  // Special service request- Hearing impaired
  //Special service request- Vision impaired
  // aria-label="Special service request- Immobile and may or may not require help to transfer to seat"
  // Mobility equipment- Travelling with own electric wheelchair in hold powered by lithium battery
  // Mobility equipment- Travelling with own electric wheelchair in hold powered by dry cell battery
  //
  // Requests will be confirmed based on availability. You will receive an email once your request is confirmed. If your specific assistance requirement is not in the above drop downs, including the need for use of a wheelchair onboard, please complete your order online and complete our Specific Service Request Form(is external link) including, where possible, your reservation number. Alternately you can contact our Guest Contact Centre(is external link) to complete your booking.
  //
  // Consent & further assistance
  // Need further assistance? Virgin Australia has partnered with Medical Travel Companions(is external link) to offer a premium service that creates independence for customers who require assistance on flights or 'transit care' in the terminals.
  // I consent to Virgin Australia collecting and processing the information I have provided about my specific assistance or meal request (including health and other sensitive information) in accordance with Virgin Australia’s Privacy Statement (Bookings) for the purpose of fulfilling my booking.
  // Yes, I agree to the above

  // Routes name
  static const launchScreen = 'launch_screen';
  static const mainTab = 'main_tab';
  static const homeScreen = 'home_screen';
  static const landingScreen = 'landing_screen';
  static const loginSignUpScreen = 'login_sign_up_screen';
  static const accountSettingScreen = 'account_setting_screen';
  static const editProfileScreen = 'edit_profile_screen';
  static const notificationScreen = 'notification_screen';
  static const updateVersionScreen = 'update_version_screen';
  static const bookScreen = 'book_screen';
  static const tripsScreen = 'trips_screen';
  static const specialsScreen = 'specials_screen';
  static const showWebsiteScreen = 'show_website_screen';
  static const chooseFlightsScreen = 'choose_flights_screen';
  static const guestsInformationScreen = 'guests_information_screen';
  static const seatSelectionScreen = 'seat_selection_screen';
  static const customerServiceScreen = 'customer_service_screen';

  // home
  static const welcome = 'Welcome,';
  static const velocityPoints = 'Velocity Points';
  static const statusCredits = 'Status Credits';
  static const bookAFlight = 'Book a flight';
  static const findMyTrip = 'Find my trip';
  static const flightStatus = 'Flight status';
  static const lowFareMoreAirSale = 'Low fare, more air sale';

  // book
  static const airportCity = 'Airport/ city';
  static const next = 'Next';
  static const oneWay = 'One Way';
  static const adult = 'Adult';
  static const child = 'Child';
  static const infant = 'Infant';
  static const direct = 'Direct';
  static const stop = 'stop';
  static const hollidayAir = 'Holliday Air';
  static const australia = 'Australia';
  static const from = 'From';
  static const chooseAFare = 'Choose a fare';
  static const departing = 'Departing ';
  static const showFlightDetails = 'Show flight details';
  static const flexibilityPlus = 'Flexibility plus a seat and bag';
  static const chooseYourSeat = 'Choose your seat';
  static const checkedBaggage = 'Checked baggage';

  static const changeFlightsMoreThan14Days =
      'Change flights more\n than 14 days to\n departure';
  static const changeFlightsLessThan14Days =
      'Change flights less\n than 14 days to\n departure';
  static const cancelForATravelCredit = 'Cancel for a travel credit';
  static const cancelForARefund = 'Cancel for a refund';
  static const foodOnboard = 'Food onboard';
  static const velocityBasePoints = 'Velocity Base Points';
  static const velocityStatusCredits = 'Velocity Status\n Credits';
  static const velocityEligibleSectors = 'Velocity Eligible\n Sectors';
  static const upgradeWithPoints = 'Upgrade with Points';
  static const pricesAreNotGuaranteedUntil =
      'Prices are not guaranteed until full payment is received or a reservation number provided.\n';

  static const standardSeatSelectionForAnEconomy =
      'Standard seat selection for an Economy Lite fare can be purchased three or more hours prior to the flight\'s scheduled departure. Standard seat selection is complimentary within three hours of the flight\'s scheduled departure. More information in the Seat Selection Terms and Conditions.';
  static const whoWillBeTravelling = 'Who will be travelling?';
  static const logInNowToPrefill = 'Log in now to pre-fill your details';

  static const accurateGuestDetailsAreImportant =
      'Accurate guest details are important to ensure we are able to contact you in the event of a flight disruption. Your name should match your government-issued photo ID used at check-in.';
  static const specificAssistanceRequest = 'Specific assistance/request';
  static const contactDetails = 'Contact details';
  static String fieldRequired = 'Field Required';
  static String continueS = 'Continue';
  static String cateringPreferences = 'Catering Preferences';

  static String snacks = 'Snacks';
  static String meals = 'Meals';
  static String teaAndCoffee = 'Tea & Coffee';

  static String milk = 'Milk';
  static String water = 'Water';
  static String waterChoice = 'Water: Cold or Room Temperature';
  static String alcoholicBeverages = 'Alcoholic Beverages';

  static String dietaryLifestyle = 'Dietary & Lifestyle';

  static String firstPreferences = 'First preferences';
  static String secondPreferences = 'Second preferences';
  static String customerNotes = 'Customer Notes';
  static String availableSeats = 'Available seats';
  static String unavailableSeats = 'Unavailable seats';
  static String selectSeat = 'Select seat';
  static String cancelSeat = 'Cancel seat';
  static String selectSeatRemind = 'Choose now to save your preferred seat. '
      'If you decide to skip this step, we will allocate a seat for you at the airport';
}
