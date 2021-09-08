const mongoose = require("mongoose");
const mongoose_fuzzy_searching = require("custom-mongoose-fuzzy-searching");
const schema = mongoose.Schema;

const categorySchema = new schema(
  {
    name: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    numOfProviders: {
      type: Number,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
  },
  { collection: "category" }
);

categorySchema.plugin(mongoose_fuzzy_searching,{fields:['name']});
// categorySchema.index({name:'text'});
module.exports = mongoose.model("category", categorySchema);
