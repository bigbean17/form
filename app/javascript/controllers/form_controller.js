import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'




const DJIBrand = ["D1","D2","D3", "D4", "D5"]
const xBrand = ["X1","X2","X3"]

export default class extends Controller {


    static targets = ['option', 'SN'];

    stopParentEvent(evt){
        evt.stopPropagation();
    }


    selectBrandServer(evt){
        const brand = evt.target.value;
        const optionTarget = this.optionTarget.id;
        const SNTarget = this.SNTarget.value;



        const frame = document.getElementById('model-selections');
        frame.src=`/new_drones/model?target=${optionTarget}&brand=${brand}&SN=${SNTarget}`

        frame.reload();

    }

    selectBrand(evt){
        const brand = evt.target.value;
        var optionTarget = this.optionTarget;
        const options = optionTarget.options;
        const optionsSize = options.length;
        
        for(var i=0; i< optionsSize; i++){
            options[i] = null
        }


        // *Server side + Turbo frame

        if(brand === "DJI"){
            for(var i=0; i<DJIBrand.length; i++){

                if(!options[i]){
                    // more current options
                    options[i] = document.createElement("option")
                }
                options[i].value = DJIBrand[i];
                options[i].text = DJIBrand[i];
            }
        }else{
            for(var i=0; i<xBrand.length; i++){
            
                if(!options[i]){
                    // more current options
                    options[i] = document.createElement("option")
                }
                options[i].value = xBrand[i];
                options[i].text = xBrand[i];
            }
        }
        ////////////////////////////////



    
    }


    formHover(){    

        var opa = 0.4

        const incOpa = () => {
            
            if(opa < 1){
                opa += 0.15;
                
                this.element.style.opacity = opa
            }
            
            setTimeout(function(){incOpa()},50);
        }

        incOpa();
    }

    formLeave(){

        var opa = 1.1

        const decOpa = () => {
            
            if(opa >0.4 ){
                opa -= 0.15;
                
                this.element.style.opacity = opa
            }
            
            setTimeout(function(){decOpa()},50);
        }

        decOpa();
    }



}
