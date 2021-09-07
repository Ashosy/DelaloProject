const mongoose  = require("mongoose");
const Order = require("../models/order_model");
const User= require("../models/user_model");

let objectId= mongoose.Types.ObjectId;

const date = new Date();
const randomnum = Math.floor(Math.random() * 9999) + 1000;// random number for b/n 1000-9999 for the unique code

const timeS = new Date();
const time_now = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;// to get the current time
const time_now_calc = `${timeS.getHours()}` + `${timeS.getMinutes()}` +`${timeS.getSeconds()}`;// to get the current time

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
           { res.status(200).json(orders);}
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
        status : "pending",
        is_completed : false,
        order_created_date : orderdate,
        saved_time: 0,
        unique_code : randomnum,
        seeker_id : req.body.seeker_id,
        provider_id : req.body.provider_id,
        

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
const orderUpdate = async function(req, res) {
    try{
        const order_id= req.params.id;
        const progress= req.body.progress;
        const order= await Order.findById(order_id);
        const provider= await User.findById(order.provider_id);
        // console.log(order.saved_time);
        console.log(order.provider_id);
        if(progress=="started"){
            let current_time=new Date();
            let minutes= current_time.getMinutes()/60;
            let seconds= current_time.getSeconds()/3600;
            const start_time=current_time.getHours()+minutes+seconds;
            
             const job= await Order.findOneAndUpdate({_id:order_id},
            {
                $set: {start_time:start_time,
                        progress:"started"
                    }
            },
            {
                useFindAndModify:true,
            }
              
            );

                res.status(201).json(job);
        }
        else if(progress=="paused"){
            const start_time=order.start_time;
            const pre_saved_time= order.saved_time;
            let current_time=new Date();
            let minutes= current_time.getMinutes()/60;
            let seconds= current_time.getSeconds()/3600;
            const paused_time=current_time.getHours()+minutes+seconds;
            const saved_time=pre_saved_time+(paused_time-start_time);
            
            const job= await Order.findOneAndUpdate({_id:order_id},
                {
                    $set: {saved_time:saved_time,
                            progress:"paused"
                        }
                },
                {
                    useFindAndModify:true,
                }
                  
                );
    
                    res.status(201).json(job);

        }
        else if(progress=="finished"){
            const start_time=order.start_time;
            const pre_saved_time= order.saved_time;
            let current_time=new Date();
            let minutes= current_time.getMinutes()/60;
            let seconds= current_time.getSeconds()/3600;
            const finished_time= current_time.getHours()+minutes+seconds;
            const saved_time= pre_saved_time +(finished_time-start_time);
            const final_payment= saved_time* provider.per_hour_wage;
            const completed_date= new Date();
            // const order_completed_date= new Date(completed_date.getTime());
            // console.log(order_completed_date);
            const job= await Order.findOneAndUpdate({_id:order_id},
                {
                    $set: {saved_time:saved_time,
                            final_payment:final_payment,
                            is_completed:true,
                            progress:"finished",
                            order_completed_date:orderdate,
                            status:"completed"
                        }
                },
                {
                    useFindAndModify:true,
                }
                  
                );
    
                    res.status(201).json(job);
        }

        

    }catch(err){
        console.error("Error updating status: ",err);
        
    }
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
                console.log(findUser);
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
        const status= req.body.status;
        const jobs= await Order.find({_id:order_id});
        if(status=="active"){
            const checkStatus= await Order.find({provider_id:jobs[0].provider_id,status:"active"});
            if(checkStatus.length!=0){
                res.status(400).json({error:"You can't have more than one active job at the same time!"});
            }
        }
        const job= await Order.findOneAndUpdate({_id:order_id},
            {
                $set: {status:req.body.status}
            },
            {
                useFindAndModify:true,
            }
              
        );

        res.status(201).json(job);

    }catch(err){
        console.error("Error updating status: ",err);
        
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
                ordergetById, 
                orderDelete,
                orderUpdate,
                getAllJobs,
                updateJobStatus,
                getActiveJob,
                getPendingJobs,
                getDeclinedJobs,
                getCompletedJobs
    
    }; //EXPORT YOUR FUNCTIONS HERE
