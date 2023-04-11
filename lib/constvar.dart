import 'Features/domain/entities/subcripttionentity.dart';

const login = "LOGIN";
const signup = "SIGN UP";
const loginheading = "WELCOME";
const loginsubheading = "GLAD TO SEE YOU AGAIN ";
const signupbuttontext = "Alraedy Have An Account?";
const loginbuttontext = "Dont Have An Account?";

const signupheading = "CREATE ACCOUNT";
const signupsubheading = "TO GET STARTED";
const successsnackbartext = "Operation Sucessfull";
const faliuresnackbartext = "SomeThing Went Wrong Try Again Later";
const plansHeading = "Subscription Plans";
const basicPlan = "Basic";
const basicFee = "Free";
const standardPlan = "Standard";
const standardFee = "2000/year";
const standardPlantitle =
    "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.";
const basicPlantitle =
    "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.";
const premiumPlantitle =
    "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.";

const premiumPlan = "Premimum";
const premiumFee = "3000/year";
const basicPlanBtnTxt = "BASIC PLAN";
const standardPlanBtnTxt = "STANDARD PLAN";
const premiumPlanBtnTxt = "PREMIUM PLAN";

const List<Subcripttionentity> basicList = [
  Subcripttionentity(
      isAvailaible: true, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: false, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: false,
      title: "All future updates for GrowX AI as long as you are a subscriber"),
  Subcripttionentity(
      isAvailaible: true, title: "More than 50% off each monthly subscription"),
];

const List<Subcripttionentity> premiumList = [
  Subcripttionentity(
      isAvailaible: true, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: false, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: false,
      title: "All future updates for GrowX AI as long as you are a subscriber"),
  Subcripttionentity(
      isAvailaible: true, title: "More than 50% off each monthly subscription"),
];

const List<Subcripttionentity> standardList = [
  Subcripttionentity(
      isAvailaible: true, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: true, title: "Every incredible feature of GrowX AI"),
  Subcripttionentity(
      isAvailaible: true,
      title: "All future updates for GrowX AI as long as you are a subscriber"),
  Subcripttionentity(
      isAvailaible: true, title: "More than 50% off each monthly subscription"),
];
