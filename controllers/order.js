const mongoose  = require("mongoose");
const Order = require("../models/order_model");
const User= require("../models/user_model");
let objectId= mongoose.Types.ObjectId;
const getAllJobs = async (req,res) =>{
    try{
        const status= req.body.status;
        const completed=req.body.completed;
        let jobs= await Order.find({provider_id: req.params.id});
        let lst=[]
        jobs.forEach((job)=>{
            console.log(job.seeker_id)
            
            user= User.find({_id:objectId("611da02f22b0e41684455e3d")});
            provider=User.find({_id:objectId("611da05a54a27c30da9fb1f3")});
            lst.push({
                "user":user,
                "provider":provider,
                "order":job,
            });
            
        });
        console.log(lst[0]);
        return res.json(jobs);
        // status and progress? should be known so that when provider clicks accept the status has to change to active
        //put method is needed for jobs as well to update status
        //when provider clicks accept or deny put route is called to update status, has to check whether there is another active job
        //

const date = new Date();
const randomnum = Math.floor(Math.random() * 9999) + 1000;

const timeS = new Date();
const time_now = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;

const orderdate = new Date(timeS.getTime());




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
        order_created_date : orderdate,
        order_completed_date : req.body.order_completed_date,
        start_time : time_now,
        saved_time: req.body.saved_time,
        unique_code : randomnum,
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

const orderput = function(req, res){
    new Order9({
        status = req.body.status,
        progress = req.body.progress,
        result,
        if(status){
            if(status == "accepted"){result.status = "active"}
            else if(status == "declined"){result.status = "declined"}
        }
        // if (progress=="started") {
        //     now =`${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`,
        //     time_difference = now - result.start_time,
        //     hours = time_difference.Date.
            
        // }
    })
}
module.exports={orderPost, orderget}; //EXPORT YOUR FUNCTIONS HERE
    }catch(err){
        console.error("Error finding jobs: ",err)
    }
}

const changeJobStatus= async (req,res)=>{
    try{
        const order_id= req.params.id;
        const providerId= req.body.provider_id;
        const job= await Order.findOneAndUpdate({_id:order_id,provider_id:providerId},
            {
                $set: {status:req.body.status}
            },
            {
                useFindAndModify:true,
            }
              
        );
            res.status(201).json({data:job});

    }catch(err){
        console.err("Error updating status: ",err);
        
    }
};


const getActiveJob = async (req,res)=>{
    try{

        const job= await Order.find({provider_id:req.params.id,status:"active"});
        if(job.length!=0){
            res.status(400).json(job);
        }
        else{
            res.status(400).send("No active jobs");
        }

    }catch(err){
        console.log("Error finding an active job: ",err)
    }
}

module.exports={getAllJobs,changeJobStatus,getActiveJob}; //EXPORT YOUR FUNCTIONS HERE
