var Car = require('./Car.js');

//Implement your Truck here
function Truck(make, model, year, color, seats, passengers, capacity) {
  Car.call(this, make, model, year, color, seats, passengers);
  if(this.seats < 3 || this.seats > 4) {
    this.seats = 3;
  }

  this.capacity = capacity || 0;
  this.cargo = 0;
};
Truck.prototype = Object.create(Car.prototype);
Truck.prototype.constructor = Truck;

Truck.prototype.load = function(newCargo) {
  if(newCargo + this.cargo > this.capacity) {
    return false;
  }

  this.cargo += newCargo;
  console.log('loaded ' + newCargo + 'lbs of cargo');
  return true;
}

Truck.prototype.unload = function(cargoRemove) {
  if(this.cargo - cargoRemove < 0) {
    return false;
  }

  this.cargo -= cargoRemove;
  console.log('unloaded ' + cargoRemove + 'lbs of cargo');
  return true;
}

module.exports = Truck;