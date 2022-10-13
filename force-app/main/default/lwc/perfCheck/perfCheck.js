import { LightningElement, wire, track } from 'lwc';
import fetchCPQSettings from '@salesforce/apex/PerfCheckCtrl.fetchCPQSettings';
// import fetchFeatureSettings from '@salesforce/apex/PerfCheckCtrl.fetchFeatureSettings';
import fetchIndex from '@salesforce/apex/PerfCheckCtrl.fetchIndex';
export default class LWCMap extends LightningElement {
    @track actualResults= [];
    @track actualResults2= [];
    @track actualResults3= [];
    @track error;
    handleGetSettings(){
        this.actualResults=[];
        fetchCPQSettings()
        .then(result =>{
            if (result) {
            let mapResult = [];
            var styleColor;    
            for(var key in result){
             
               mapResult.push({value:result[key], key:key});
            }
            console.log('==mapResult==', mapResult);
            this.actualResults = mapResult.map(e => {
                let isLess = e.value.Expected.toLowerCase() != e.value.Current.toLowerCase();
                console.log('==isLess==', isLess);
                if(isLess){
                    if(e.value.Current.toLowerCase()=='not present' ){
                        e.styleColor= 'background-color:#eede72';
                    }
                    else
                    e.styleColor= 'background-color:#f37a7a';
                }
                else
                e.styleColor = 'background-color:none';
                return e;
            });
           console.log('==data==', this.actualResults);
            }
        })
        .catch(error =>{
            this.errorMsg = error;
        })
        this.actualResults2=[];
        fetchFeatureSettings()
        .then(result =>{
            if (result) {
            let mapResult = [];
            var styleColor;  
            console.log('==result==', result);
            for(var key in result){
                mapResult.push({value:result[key], key:key});
            }
            console.log('==mapResult==', mapResult);
            this.actualResults2 = mapResult.map(e => {
                let isLess = e.value.Expected.toLowerCase() != e.value.Current.toLowerCase();
                console.log('==isLess==', isLess);
                if(isLess){
                    if(e.value.Current.toLowerCase()=='not present' ){
                        e.styleColor= 'background-color:#eede72';
                    }
                    else
                    e.styleColor= 'background-color:#f37a7a';
                }
                else
                e.styleColor = 'background-color:none';
                return e;
            });
            console.log('==data==', this.actualResults2);
        }
        })
           
        .catch(error =>{
            this.errorMsg = error;
        })
        this.actualResults3=[];
        fetchIndex()
        .then(result =>{
            if (result) {
            let mapResult = [];
            var styleColor;  
            console.log('==result==', result);
            for(var key in result){
                mapResult.push({value:result[key], key:key});
                console.log('key********'+key);
                console.log('Value********'+result[key]);
            }
            console.log('==mapResult==', mapResult);
            this.actualResults3 = mapResult.map(e => {
                if(!e.value){
                        e.styleColor= 'background-color:#f37a7a';
                    e.value='Not Indexed'}
                else{
                e.styleColor = 'background-color:none';
                e.value='Indexed'}
                return e;
            });
            console.log('==data==', this.actualResults3);
        }
        })
        .catch(error =>{
            this.errorMsg = error;
        }) 
    }
    connectedCallback() {
        this.actualResults=[];
        fetchCPQSettings()
        .then(result =>{
            if (result) {
            let mapResult = [];
            var styleColor;  
            console.log('==result==', result);
            for(var key in result){
                mapResult.push({value:result[key], key:key});
            }
            console.log('==mapResult==', mapResult);
            this.actualResults = mapResult.map(e => {
                let isLess = e.value.Expected.toLowerCase() != e.value.Current.toLowerCase();
                console.log('==isLess==', isLess);
                if(isLess){
                    if(e.value.Current.toLowerCase()=='not present' ){
                        e.styleColor= 'background-color:#eede72';
                    }
                    else
                    e.styleColor= 'background-color:#f37a7a';
                }
                else
                e.styleColor = 'background-color:none';
                return e;
            });
            console.log('==data==', this.actualResults);
        }
        })
           
        .catch(error =>{
            this.errorMsg = error;
        }) 


        // this.actualResults2=[];
        // fetchFeatureSettings()
        // .then(result =>{
        //     if (result) {
        //     let mapResult = [];
        //     var styleColor;  
        //     console.log('==result==', result);
        //     for(var key in result){
        //         mapResult.push({value:result[key], key:key});
        //     }
        //     console.log('==mapResult==', mapResult);
        //     this.actualResults2 = mapResult.map(e => {
        //         let isLess = e.value.Expected.toLowerCase() != e.value.Current.toLowerCase();
        //         console.log('==isLess==', isLess);
        //         if(isLess){
        //             if(e.value.Current.toLowerCase()=='not present' ){
        //                 e.styleColor= 'background-color:#eede72';
        //             }
        //             else
        //             e.styleColor= 'background-color:#f37a7a';
        //         }
        //         else
        //         e.styleColor = 'background-color:none';
        //         return e;
        //     });
        //     console.log('==data==', this.actualResults2);
        // }
        // })
           
        // .catch(error =>{
        //     this.errorMsg = error;
        // }) 
        this.actualResults3=[];
        fetchIndex()
        .then(result =>{
            if (result) {
            let mapResult = [];
            var styleColor;  
            console.log('==result==', result);
            for(var key in result){
                mapResult.push({value:result[key], key:key});
                console.log('key********'+key);
                console.log('Value********'+result[key]);
            }
            console.log('==mapResult==', mapResult);
            this.actualResults3 = mapResult.map(e => {
                if(!e.value){
                        e.styleColor= 'background-color:#f37a7a';
                    e.value='Not Indexed'}
                else{
                e.styleColor = 'background-color:none';
                e.value='Indexed'}
                return e;
            });
            console.log('==data==', this.actualResults3);
        }
        })
        .catch(error =>{
            this.errorMsg = error;
        })       }

    }
