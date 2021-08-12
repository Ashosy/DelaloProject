const express = require("express");
const { user } = require("../controllers/user");
const { category } = require("../controllers/category");
const { review } = require("../controllers/review");
const { order } = require("../controllers/order");
const router = express.Router();

router.get("/user", user);

router.get("/category", category);

router.get("/review", review);
router.get("/order", order);

module.exports = router;
