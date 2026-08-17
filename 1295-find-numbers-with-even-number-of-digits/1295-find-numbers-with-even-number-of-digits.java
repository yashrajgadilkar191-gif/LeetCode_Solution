class Solution {
    public int findNumbers(int[] nums) {
       int count=0;
       for (int ele:nums){
        String s=Integer.toString(ele);
        if(s.length() % 2 == 0){
            count++;
       }
    }
    return count;
    } 
}