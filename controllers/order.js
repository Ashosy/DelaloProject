const mongoose  = require("mongoose");
const Order = require("../models/order_model");
const User= require("../models/user_model");

let objectId= mongoose.Types.ObjectId;

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


async function asyncForEach(jobs,callback){
    for (let i=0;i<jobs.length;i++){
        await callback(jobs[i],i,jobs);
    };
};

const getAllJobs = async (req,res) =>{
    try{
        
        let jobs= await Order.find({provider_id: req.params.id});
        let lst=[]
        if(jobs.length!=0){
        const toList= async()=>{
            await asyncForEach(jobs,async(job)=>{
                const findUser = await User.find({_id:job.seeker_id},(err,userObj)=>{
                            if(err){
                                return err
                            }else if (userObj){
                                return userObj
                            }else{
                                return null
                            }
                        });

                const findProvider= await User.find({_id:job.provider_id},(err,userObj)=>{
                    if(err){
                        return err
                    }else if (userObj){
                        return userObj
                    }else{
                        return null
                    }
                });

                lst.push({
                        "User":JSON.parse(JSON.stringify(findUser))[0],
                        "Provider":JSON.parse(JSON.stringify(findProvider))[0],
                        "Order":job,
                    });

                // console.log(lst)
            });

            res.send(lst);
        };

        toList();

    }else{
        res.status(400).send("No jobs to show");
    }
        
    }catch(err){
        console.error("Error finding jobs: ",err)
    }
}

const updateJobStatus= async (req,res)=>{
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

        res.status(201).json(job);

    }catch(err){
        console.err("Error updating status: ",err);
        
    }
};


const getActiveJob = async (req,res)=>{
    try{

        const jobs= await Order.find({provider_id:req.params.id,status:"active"});
        let lst=[]
        if(jobs.length!=0){
            const toList= async()=>{
                await asyncForEach(jobs,async(job)=>{
                    const findUser = await User.find({_id:job.seeker_id},(err,userObj)=>{
                                if(err){
                                    return err
                                }else if (userObj){
                                    return userObj
                                }else{
                                    return null
                                }
                            });
    
                    const findProvider= await User.find({_id:job.provider_id},(err,userObj)=>{
                        if(err){
                            return err
                        }else if (userObj){
                            return userObj
                        }else{
                            return null
                        }
                    });
    
                    lst.push({
                            "User":JSON.parse(JSON.stringify(findUser))[0],
                            "Provider":JSON.parse(JSON.stringify(findProvider))[0],
                            "Order":job,
                        });
    
                    // console.log(lst)
                });
    
                res.status(400).send(lst);
            };
    
            toList();
            
        }
        else{
            res.status(400).send("No active jobs");
        }

    }catch(err){
        console.log("Error finding an active job: ",err)
    }
};

const getPendingJobs = async(req,res)=>{
    try{
        const jobs= await Order.find({provider_id:req.params.id,status:"pending"});
        let lst=[]
        if(jobs.length!=0){
            const toList= async()=>{
                await asyncForEach(jobs,async(job)=>{
                    const findUser = await User.find({_id:job.seeker_id},(err,userObj)=>{
                                if(err){
                                    return err
                                }else if (userObj){
                                    return userObj
                                }else{
                                    return null
                                }
                            });
    
                    const findProvider= await User.find({_id:job.provider_id},(err,userObj)=>{
                        if(err){
                            return err
                        }else if (userObj){
                            return userObj
                        }else{
                            return null
                        }
                    });
    
                    lst.push({
                            "User":JSON.parse(JSON.stringify(findUser))[0],
                            "Provider":JSON.parse(JSON.stringify(findProvider))[0],
                            "Order":job,
                        });
    
                    // console.log(lst)
                });
    
                res.status(400).send(lst);
            };
    
            toList();
            
        }
        else{
            res.status(400).send("No pending jobs");
        }
    }catch(err){
        console.log("Error finding pending jobs: ",err);
    }
};

const getDeclinedJobs = async (req,res)=>{
    try{
        const jobs= await Order.find({provider_id:req.params.id,status:"declined"});
        let lst=[]
        if(jobs.length!=0){
            const toList= async()=>{
                await asyncForEach(jobs,async(job)=>{
                    const findUser = await User.find({_id:job.seeker_id},(err,userObj)=>{
                                if(err){
                                    return err
                                }else if (userObj){
                                    return userObj
                                }else{
                                    return null
                                }
                            });
    
                    const findProvider= await User.find({_id:job.provider_id},(err,userObj)=>{
                        if(err){
                            return err
                        }else if (userObj){
                            return userObj
                        }else{
                            return null
                        }
                    });
    
                    lst.push({
                            "User":JSON.parse(JSON.stringify(findUser))[0],
                            "Provider":JSON.parse(JSON.stringify(findProvider))[0],
                            "Order":job,
                        });
    
                    // console.log(lst)
                });
    
                res.status(400).send(lst);
            };
    
            toList();
            
        }
        else{
            res.status(400).send("No declined jobs");
        }
    }catch(err){
        console.log("Error finding declined jobs: ",err);
    }
};

const getCompletedJobs = async (req,res)=>{
    try{
        const jobs= await Order.find({provider_id:req.params.id,is_completed:true});
        let lst=[]
        if(jobs.length!=0){
            const toList= async()=>{
                await asyncForEach(jobs,async(job)=>{
                    const findUser = await User.find({_id:job.seeker_id},(err,userObj)=>{
                                if(err){
                                    return err
                                }else if (userObj){
                                    return userObj
                                }else{
                                    return null
                                }
                            });
    
                    const findProvider= await User.find({_id:job.provider_id},(err,userObj)=>{
                        if(err){
                            return err
                        }else if (userObj){
                            return userObj
                        }else{
                            return null
                        }
                    });
    
                    lst.push({
                            "User":JSON.parse(JSON.stringify(findUser))[0],
                            "Provider":JSON.parse(JSON.stringify(findProvider))[0],
                            "Order":job,
                        });
    
                    // console.log(lst)
                });
    
                res.status(400).send(lst);
            };
    
            toList();
            
        }
        else{
            res.status(400).send("No completed jobs");
        }
    }catch(err){
        console.log("Error finding completed jobs: ",err);
    }
};

module.exports={orderPost, 
                orderget,
                getAllJobs,
                updateJobStatus,
                getActiveJob,
                getPendingJobs,
                getDeclinedJobs,
                getCompletedJobs
    
    }; //EXPORT YOUR FUNCTIONS HERE
