function absrb_ornt = absrb_test(absrb_p)
%ABSRB_TEST Summary of this function goes here
%   Detailed explanation goes here
    
    absrb_ornt = false;

    tester = rand;
    if tester<absrb_p
        absrb_ornt = true;
    end
end

