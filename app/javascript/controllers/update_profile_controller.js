import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "image", "imageForm", "fileField", "imageSecond", "imageSecondForm", "fileFieldSecond", "locationForm", "locationButton", "bioForm", "bioButton" ]

  connect(){
    this.fileFieldTarget.addEventListener('change', () => {
      if (this.fileFieldTarget.files.length > 0) {
        this.imageFormTarget.submit();
      }
    });
    
    this.imageTarget.addEventListener('click', () => {
      this.fileFieldTarget.click();
    });

    this.fileFieldSecondTarget.addEventListener('change', () => {
      if (this.fileFieldSecondTarget.files.length > 0) {
        this.imageSecondFormTarget.submit();
      }
    });
    
    this.imageSecondTarget.addEventListener('click', () => {
      this.fileFieldSecondTarget.click();
    });

    this.locationFormTarget.addEventListener('turbo:submit-end', () => {
      this.locationButtonTarget.click();
    })

    this.bioFormTarget.addEventListener('turbo:submit-end', () => {
      this.bioButtonTarget.click();
    })
  }
}
