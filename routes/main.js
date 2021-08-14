const express = require("express");
const { user } = require("../controllers/user");
const {
  postProvider,
  getProvider,
  getProviderById,
} = require("../controllers/provider");
const { category } = require("../controllers/category");
const { review } = require("../controllers/review");
const { order } = require("../controllers/order");
const router = express.Router();

router.get("/user", user);
router.get("/category", category);
router.get("/review", review);
router.get("/order", order);

// provider routes
router.post("/provider", postProvider);
router.get("/provider", getProvider);
router.get("/provider/:id", getProviderById);

module.exports = router;
