public class HomePageController1 {
    public List<HomepageQA__mdt> Alllist{get;set;}
    public boolean execute = false;
    public HomePageController1(){
        Date todaydate = Date.today();
        List<HomepageQA__mdt> mdt = [select id,Event_Date__c,Event_Description__c,Event_Title__c,Random__c,Fixed_Date__c  from HomepageQA__mdt];
        List<HomepageQA__mdt> mdt1 =[select id,Event_Date__c,Event_Description__c,Event_Title__c,Random__c,Fixed_Date__c  from HomepageQA__mdt where Random__c = true];
        //system.debug(mdt);
        List<HomepageQA__mdt> allevent = new List<HomepageQA__mdt>();
        Alllist = allevent;
        Integer sampleSize = mdt1.size();
        List<HomepageQA__mdt> data = getContactSample(mdt1,sampleSize);
        
        for(HomepageQA__mdt md : mdt){
            if(md.Fixed_Date__c == true && md.Event_Date__c == todaydate){
                execute = true;
                HomepageQA__mdt m = new HomepageQA__mdt();
                m.Event_Title__c = md.Event_Title__c;
                m.Event_Description__c = md.Event_Description__c;
                allevent.add(m);
                system.debug('if');
            }
        }
        
        for(HomepageQA__mdt md1 : data){
            if(md1.Fixed_Date__c == false && md1.Event_Date__c == null && !execute){
                execute = true;
                HomepageQA__mdt m = new HomepageQA__mdt();
                m.Event_Title__c = md1.Event_Title__c;
                m.Event_Description__c = md1.Event_Description__c;
                allevent.add(m);
                system.debug('if');
            }
            
        }
        
    }
    public List<HomepageQA__mdt> getContactSample(List<HomepageQA__mdt> Homepagelist, Integer sampleSize){
        List<HomepageQA__mdt> data = new List<HomepageQA__mdt>();
        
        Integer indexOfContact = getRandomNumber(Homepagelist.size() - data.size());
        data.add(Homepagelist[indexOfContact]);
        Homepagelist.remove(indexOfContact);
        return data;
    }    
    public Integer getRandomNumber(Integer ceiling){
        return Integer.valueof((Math.random() * ceiling));
    }
}