%macro generate(n_rows,n_num_cols,n_char_cols,outdata=test,seed=0);
data &outdata;
array nums[&n_num_cols];
array chars[&n_char_cols] $;
temp = "abcdefghijklmnopqrstuvwxyz";
do i=1 to &n_rows;
    do j=1 to &n_num_cols;
        nums[j] = ranuni(&seed);
    end;
    do j=1 to &n_char_cols;
        chars[j] = substr(temp,ceil(ranuni(&seed)*18),8);
    end;
    output;
end;
drop i j temp;
run;

%mend;

%generate(10,10,10,outdata=test);
