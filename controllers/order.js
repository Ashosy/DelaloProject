const { models } = require("mongoose");
const Order = require("../models/order_model");

const date = new Date();
const randomnum = Math.floor(Math.random() * 9999) + 1000;

const timeS = new Date();
const time_now = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;

const orderdate = new Date(timeS.getTime());


//get all orders
const orderget = function(req, res){
    Order.find().then((orders)=>{
            res.status(201).json(orders);
        }).catch((err) => {
            res.json(
                {message: err.message}
            );
        });

};
//get a single order
const ordergetById = function(req, res){
    Order.findById(req.params.id)
    .then((order)=>{
        res.send(order);
    }).catch((err) => {
        res.json(
            {message: err.message}
        );
    });
};
//post order
const orderPost = function(req, res){
   new Order({
        status : req.body.status,
        progress : req.body.progress,
        is_completed : req.body.is_completed,
        order_created_date : orderdate,
        order_completed_date : req.body.order_completed_date,
        start_time : time_now,
        saved_time: req.body.saved_time,
        unique_code : randomnum,
        seeker_id : req.body.seeker_id,
        provider_id : req.body.provider_id,
        final_payment: req.body.final_payment

    })
    .save()
    .then((orders)=>{
        res.status(201).json({
            order : orders,
            message: `order added`
        });
    }).catch((err)=>{
        res.json(
            {message: err.message}
        );
    })
}
//update order
const orderUpdate = function(req, res){
    // new Order9({
    //     status : req.body.status,
    //     progress : req.body.progress,
    //     result,
    //     if(status){
    //         if(status == "accepted"){
    //             result.status = "active"
    //         }
    //         else if(
    //             status == "declined"
    //             ){result.status = "declined"
    //         }
    //     }
    //     // if (progress=="started") {
    //     //     now =`${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`,
    //     //     time_difference = now - result.start_time,
    //     //     hours = time_difference.Date.
            
    //     // }
    // })
}
module.exports={orderPost, orderget, ordergetById}; //EXPORT YOUR FUNCTIONS HERE
