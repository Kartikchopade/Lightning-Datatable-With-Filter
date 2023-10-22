public class HomePageController {
   
    public List<HomepageQA__mdt> Alllist{get;set;}
    public HomePageController(){
        Datetime AllDate = system.now();
        string monthName = AllDate.format('MMMM');
		String curdate = (Date.today()).format();
        string currentdate = curdate.left(5);
        boolean homeview = false;
        
        List<HomepageQA__mdt> mdt = [select id,Event_Date__c,Event_Description__c,Event_Title__c from HomepageQA__mdt];
        List<HomepageQA__mdt> allevent = new List<HomepageQA__mdt>();
        Alllist = allevent;
        for(HomepageQA__mdt md : mdt){
           
           	Date eventdate1 = md.Event_Date__c;
            Datetime eventDateTime = eventdate1;
            string eventmonthname = eventDateTime.format('MMMM');
            
            string eventdate = (md.Event_Date__c).format();
            string lateventdate = eventdate.left(5);
           	String todaydate = (md.Event_Date__c).day()+'/'+(md.Event_Date__c).month();
            
            Datetime evdate = md.Event_Date__c;
            
            
            
            if(currentdate.equals(lateventdate)){
                HomepageQA__mdt m = new HomepageQA__mdt();
                m.Event_Title__c = md.Event_Title__c;
                m.Event_Description__c = md.Event_Description__c;
                allevent.add(m);
                homeview = true;
                //system.debug(md.Event_Title__c+'   '+md.Event_Date__c.format()+'  '+md.Event_Description__c);
                system.debug('if');
            }
            else if(monthName.equals(eventmonthname)){
                HomepageQA__mdt m = new HomepageQA__mdt();
                m.Event_Title__c = md.Event_Title__c;
                m.Event_Description__c = md.Event_Description__c;
                allevent.add(m);
                homeview = true;
                //system.debug(md.Event_Title__c+'   '+md.Event_Date__c.format()+'  '+md.Event_Description__c);
                system.debug('else if 1');
            }
            
        }
        
       
    }

}
 /*List<HomepageQA__mdt> mdt = [select id,Event_Date__c,Event_Description__c,Event_Title__c from HomepageQA__mdt];
        for(HomepageQA__mdt md : mdt){
            Datetime AllDate = system.now();
            string monthName = AllDate.format('MMMM');
   			
            Date eventmonth = md.Event_Date__c;
            Datetime todayDateTime = eventmonth;
            string eventmon = todayDateTime.format('MMMM');
            
            if((system.today()).format() == md.Event_Date__c.format()){
                //Data = md.Event_Title__c+'   '+md.Event_Date__c.format()+'  '+md.Event_Description__c;
                system.debug(md.Event_Date__c.format()+' '+md.Event_Description__c+' '+md.Event_Title__c);
                system.debug('if');
                break;
            }
            else if(monthName.Equals(eventmon)){
               system.debug(md.Event_Date__c.format()+' '+md.Event_Description__c+' '+md.Event_Title__c); 
                system.debug('else');
            }
        }
*/

 /*for(HomepageQA__mdt md : mdt){
            String eventdte = md.Event_Date__c.format();
            String eventdate  = eventdte.left(5);
            
            /*if(currentdate == eventdate){
                Data = md.Event_Title__c+' '+md.Event_Description__c;
            }else if(monthName == 'May'){
                Data = md.Event_Title__c+' '+md.Event_Description__c;
            }
            
        }*/

/*Date firstMonday = Date.newInstance(evdate.year(), evdate.month(), evdate.day()).toStartOfMonth().toStartOfWeek().addDays(3);    
            if(firstMonday < date.newInstance(evdate.year(), evdate.month(), evdate.day()).toStartOfmonth())
                firstMonday = firstMonday.addDays(7);
             Date thirdMonday = firstMonday.addDays(14);
            string formatdate = thirdMonday.format();
            string secondmonday = formatdate.left(5);
            system.debug('Third Monday: '+thirdMonday);*/

/*else if(currentdate.equals(secondmonday)){
                HomepageQA__mdt m = new HomepageQA__mdt();
                m.Event_Title__c = md.Event_Title__c;
                m.Event_Description__c = md.Event_Description__c;
                allevent.add(m);
                system.debug('else if 2');
            }*/