const mongoose  = require("mongoose");
const Order = require("../models/order_model");
const User= require("../models/user_model");

let objectId= mongoose.Types.ObjectId;

const date = new Date();
const randomnum = Math.floor(Math.random() * 9999) + 1000;// random number for b/n 1000-9999 for the unique code

const timeS = new Date();
const time_now = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;// to get the current time
const time_nowcalc = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;// to get the current time

const orderdate = new Date(timeS.getTime()); 


//get all orders
const orderget = function(req, res){
    Order.find()
        .then((orders)=>{
            if(!orders){ 
                res.status(404)
                .send({message: `Couldn't Find`});
            }
            else
           { res.status(201).json(orders);}
        })
        .catch((err) => {
            res.json(
                {message: err.message}
            );
        });

};


//get a single order by seeker_id
const ordergetById = function(req, res){
    const s_id = {seeker_id:req.params.id}; // s_id to the requested id
    Order.find(s_id)
    .then((order)=>{
        if(!order){
            res.status(404)
            .send({message: `Couldn't Find id ${req.params.id}`});
        }
        else
        {res.status(200).send(order);}
       
    }).catch((err) => {
        res.json(
            {message:`Id ${req.params.id} Not Found`}
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
        if(!orders){
            res.status(404)
            .send({message: `Couldn't post`});
        }
        else{res.status(201).json({
            order : orders,
            message: `order added`
        });}
    }).catch((err)=>{
        res.json(
            {message: err.message}
        );
    })
}



//update order using seeker id
const orderUpdate = function(req, res){
    console.log(req);
    if(req.params.status){
        if(req.params.status == "accepted"){
           req.params.status = "active";
        }
        else if(req.params.status == "declined"){
            req.params.status = "decline";
        }
    }
    if(req.params.progress == "started"){
        const now = orderdate;
        console.log(now);

    }
    Order.findByIdAndUpdate(
       { 
         _id: req.params.id
        },
    
        req.body,
        {new: true},
    
        )
        
        .then((order)=>{
            if(!order){
                res.status(404).send({
                    message : `Couldn't update order with id ${req.params.id}`
                });
            }
            else
            {
               
                res.status(201).send(order);
            }
           
        }).catch((err)=>{
            res.status(500).send({
                message : `Error updating ${req.params.id}`
            })
        })   
}


//delete order using seeker id
const orderDelete = function(req, res){
    Order.findByIdAndDelete({_id:req.params.id})
        .then((result)=>{
            if(!result){
                res.status(404)
                .send({message: `Couldn't Find id ${req.params.id}`});
            }
            else
            {res.send(result);}
            // console.log(`${req.params.id} deleted`);
        })
        .catch((err)=>{
            console.log(msg.err);
        })

};
module.exports={orderPost, orderget, ordergetById, orderDelete, orderUpdate}; //EXPORT YOUR FUNCTIONS HERE
