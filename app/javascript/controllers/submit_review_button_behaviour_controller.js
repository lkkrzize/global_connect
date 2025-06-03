import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "input"];

  connect() {
  };

  buttonBehaviour() {
    const allFilled = (inputs) => {
      return inputs.every((input) => {
        return input.value !== ""
      });
    };

    if (allFilled(this.inputTargets)) {
      this.buttonTarget.classList.remove("disabled")
    } else {
      this.buttonTarget.classList.add("disabled")
    };
  };
};
