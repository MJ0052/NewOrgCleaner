global class IterableConfigurationHandler implements iterable<Map<String,List<sObject>>>{
   global Iterator<Map<String,List<sObject>>> Iterator(){
      return new CustomIterable();
   }
}