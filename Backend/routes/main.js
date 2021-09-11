const express = require("express");
const verify = require("../middlewares/verification");

const {
  register,
  getUsers,
  getUserById,
  deleteUser,
  login,
  logout,
  updateUser,
  getUserByEmail,
} = require("../controllers/user"); // IMPORT USER FUNCTIONS HERE

const {
  searchProviders,
  postProvider,
  getProvider,
  getProviderById,
  updateProviderById,
  getProvidersByCategory,
  getTopProviders,
  getTopProvidersByCategory,
} = require("../controllers/provider"); //IMPORT PROVIDER FUNCTIONS HERE

const {
  orderPost,
  ordergetAll,
  ordergetById,
  orderDelete,
  orderUpdate,
  ordergetAllCompleted,
  getActiveOrder,
  getAllJobs,
  getActiveJob,
  getPendingJobs,
  updateJobStatus,
  getDeclinedJobs,
  getCompletedJobs,
  getPendingOrders,
  getDeclinedOrders,
  getCompletedOrders,
} = require("../controllers/order"); // IMPORT ORDER FUNCTIONS HERE
const {
  getCategories,
  getCategoryById,
  deleteCategory,
  addCategory,
  updateCategory,
  seachCategory,
} = require("../controllers/category"); // IMPORT CATEGORY FUNCTIONS HERE

const {
  getReviews,
  getReviewById,
  addReview,
} = require("../controllers/review"); // // IMPORT REVIEW FUNCTIONS HERE

const router = express.Router();

// user routes
router.get("/users", verify, getUsers);
router.get("/users/:id", getUserById);
router.get("/users/byEmail/:email", getUserByEmail);
router.delete("/users/:id", deleteUser);
router.put("/users/:id", updateUser);
router.post("/login", login);
router.post("/users", register);
router.get("/logout", verify, logout);

// provider routes
router.post("/provider", postProvider);
router.get("/provider", getProvider);
router.get("/provider/top", getTopProviders);
router.get("/provider/:id", getProviderById);
router.patch("/provider/:id", updateProviderById);
router.get("/provider/category/:category_name", getProvidersByCategory);
router.get("/provider/top/category/:category_name", getTopProvidersByCategory);
router.get("/searchProviders", searchProviders);

//category routes
router.get("/category", getCategories);
router.get("/category/:id", getCategoryById);
router.delete("/category/:id", deleteCategory);
router.post("/category", addCategory);
router.put("/category/:id", updateCategory);
router.get("/searchCategory", seachCategory);

//order routes

router.get("/allOrders/:id", ordergetAll);
router.get("/orderAllCompleted", ordergetAllCompleted);
router.post("/order", orderPost);
router.get("/order/:id", ordergetById);
router.delete("/order/:id", orderDelete);
router.put("/order/:id", orderUpdate);
router.get("/activeOrder/:id", getActiveOrder);
router.get("/pendingOrders/:id", getPendingOrders);
router.get("/declinedOrders/:id", getDeclinedOrders);
router.get("/completedOrders/:id", getCompletedOrders);
router.get("/allJobs/:id", getAllJobs);
router.put("/updateStatus/:id", updateJobStatus);
router.get("/activeJob/:id", getActiveJob);
router.get("/pendingJobs/:id", getPendingJobs);
router.get("/declinedJobs/:id", getDeclinedJobs);
router.get("/completedJobs/:id", getCompletedJobs);

//review routes
router.get("/review", getReviews);
router.get("/review/:id", getReviewById);
router.post("/review", addReview);

module.exports = router;
