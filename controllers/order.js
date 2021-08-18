const { models } = require("mongoose");
const Order = require("../models/order_model");

const date = new Date();
const randomnum = Math.floor(Math.random() * 9999) + 1000;

const orderget = function(req, res){
    Order
        .find()
        .then((orders)=>{
            res.status(201).json(orders);
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });

};
const orderPost = function(req, res){
   new Order({
        status : req.body.status,
        progress : req.body.progress,
        is_completed : req.body.is_completed,
        order_created_date : req.body.order_created_date,
        order_completed_date : req.body.order_completed_date,
        start_time : req.body.start_time,
        saved_time: req.body.saved_time,
        unique_code : req.body.unique_code,
        seeker_id : req.body.seeker_id,
        provider_id : req.body.provider_id,
        final_payment: req.body.final_payment,

    })
    
    .save()
    .then((orders)=>{
        res.status(201).json({
            order : orders,
            message: `order Successfully`
        });
    })
   
    .catch((err)=>{
        res.json(
            {message: err.message}
        );
    })
}
module.exports={orderPost, orderget}; //EXPORT YOUR FUNCTIONS HERE
