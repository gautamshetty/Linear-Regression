% Implementation of training data using linear regression.
function output = linear_regression( training_file, degree, lambda )

    load (training_file);

    x_input = sample_data1(:,1);
    t_target = sample_data1(:,2);

    fie = [];
    for i=0:degree
        fie = [fie x_input.^i];
    end

    wml = fie' * fie;
    if lambda ~= 0
        I = eye(2);
        if degree == 2
            I = eye(3);
        end

        wml = lambda * I + fie' * fie;
    end

    wml = inv(wml) * fie' * t_target;

    for i=0:degree
        fprintf('w%d=%.4f\n',i, wml(i+1));
    end

    if degree == 1
        fprintf('w2=%.4f\n',0);
    end

end
