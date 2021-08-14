const express = require("express");

const {}= require("../controllers/user"); // IMPORT USER FUNCTIONS HERE

const {
  postProvider,
  getProvider,
  getProviderById,
} = require("../controllers/provider");

const {} = require("../controllers/order"); // IMPORT ORDER FUNCTIONS HERE
const {} = require("../controllers/review"); // IMPORT REVIEW FUNCTIONS HERE

const router = express.Router();
// user routes

// provider routes
router.post("/provider", postProvider);
router.get("/provider", getProvider);
router.get("/provider/:id", getProviderById);

//category routes


//order routes


//review routes


module.exports = router;
