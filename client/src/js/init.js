let model;
let controller;
let view;

function init() {
  model = new Model();
  controller = new Controller(model);
  view = new View(model, controller);
}

init();
