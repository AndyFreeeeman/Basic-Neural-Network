
learning_rate = 1 ;
epoch = 1 ;
sum_squared_error_store = linspace(0,0,10) ;
error_store = linspace(0,0,4) ;
sum_squared_error = 1 ;
input_x1 = 1 ;
input_x2 = 1 ;
episode = 0 ;
y_d5 = 0 ;

w_13 = 0.5 ;
w_14 = 0.9 ;
w_23 = 0.4 ;
w_24 = 1.0 ;
w_35 = -1.2 ;
w_45 = 1.1 ;

theta_3 = 0.8 ;
theta_4 = -0.1 ;
theta_5 = 0.3 ;

while sum_squared_error > 0.001

    y_3 = 1 / ( 1 + exp( - ( input_x1 * w_13 + input_x2 * w_23 - theta_3 ) ) ) ;
    y_4 = 1 / ( 1 + exp( - ( input_x1 * w_14 + input_x2 * w_24 - theta_4 ) ) ) ;

    y_5 = 1 / ( 1 + exp( - ( y_3 * w_35 + y_4 * w_45 - theta_5 ) ) ) ;

    error = y_d5 - y_5 ;

    error_gradient_5 = y_5 * ( 1 - y_5 ) * error ;

    gradient_w_35 = learning_rate * y_3 * error_gradient_5 ;
    gradient_w_45 = learning_rate * y_4 * error_gradient_5 ;
    gradient_theta_5 = learning_rate * -1 * error_gradient_5 ;

    error_gradient_3 = y_3 * ( 1 - y_3 ) * error_gradient_5 * w_35 ;
    error_gradient_4 = y_4 * ( 1 - y_4 ) * error_gradient_5 * w_45 ;

    gradient_w_13 = learning_rate * input_x1 * error_gradient_3 ;
    gradient_w_23 = learning_rate * input_x2 * error_gradient_3 ;
    gradient_theta_3 = learning_rate * -1 * error_gradient_3 ;

    gradient_w_14 = learning_rate * input_x1 * error_gradient_4 ;
    gradient_w_24 = learning_rate * input_x2 * error_gradient_4 ;
    gradient_theta_4 = learning_rate * -1 * error_gradient_4 ;

    w_13 = w_13 + gradient_w_13 ;
    w_14 = w_14 + gradient_w_14 ;
    w_23 = w_23 + gradient_w_23 ;
    w_24 = w_24 + gradient_w_24 ;
    w_35 = w_35 + gradient_w_35 ;
    w_45 = w_45 + gradient_w_45 ;
    theta_3 = theta_3 + gradient_theta_3 ;
    theta_4 = theta_4 + gradient_theta_4 ;
    theta_5 = theta_5 + gradient_theta_5 ;

    disp( sum_squared_error ) ;

    if episode == 0
        input_x1 = 0 ;
        input_x2 = 1 ;
        y_d5 = 1 ;
        episode = episode + 1 ;
        error_store(1) = error ;

    elseif episode == 1
        input_x1 = 1 ;
        input_x2 = 0 ;
        y_d5 = 1 ;
        episode = episode + 1 ;
        error_store(2) = error ;

    elseif episode == 2
        input_x1 = 0 ;
        input_x2 = 0 ;
        y_d5 = 0 ;
        episode = episode + 1 ;
        error_store(3) = error ;

    elseif episode == 3
        input_x1 = 0 ;
        input_x2 = 0 ;
        y_d5 = 0 ;
        episode = 0 ;
        error_store(4) = error ;

        sum_squared_error = error_store(1) ^ 2 + error_store(2) ^ 2 + error_store(3) ^ 2 + error_store(4) ^ 2 ;
        sum_squared_error_store ( epoch ) = sum_squared_error ;

        epoch = epoch + 1 ;
       
    end

end

fprintf( " w_13 = " + w_13 ) ;
fprintf( " w_14 = " + w_14 ) ;
fprintf( " w_23 = " + w_23 ) ;
fprintf( " w_24 = " + w_24 ) ;
fprintf( " w_35 = " + w_35 ) ;
fprintf( " w_45 = " + w_45 ) ;
fprintf( " theta_3 = " + theta_3 ) ;
fprintf( " theta_4 = " + theta_4 ) ;
fprintf( " theta_5 = " + theta_5 ) ;
fprintf( " Epoch = " + epoch ) ;

y = sum_squared_error_store ;
plot( y , 'M-o' ) ;
grid on ;
