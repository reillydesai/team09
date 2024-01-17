%% Setup robot
travelTime = 2; % Defines the travel time
robot = Robot(); % Creates robot object
robot.writeTime(travelTime); % Write travel time
robot.writeMotorState(true); % Write position mode
%% Program 

robot.writeJoints(0); % Write joints to zero position
pause(travelTime); % Wait for trajectory completion

robot.writeGripper(true);

robot.writeJoints([-45, 10, 30, -15]); % Write joint values

tic; % Start timer

while toc < travelTime
    disp(robot.getJointsReadings()); % Read joint values
end


robot.writeJoints([45, -10, -30, 15]); % Write joint values

tic; % Start timer

while toc < travelTime
    disp(robot.getJointsReadings()); % Read joint values
end


robot.writeJoints([0, 0, 0, 0]); % Write joint values

tic; % Start timer

while toc < travelTime
    disp(robot.getJointsReadings()); % Read joint values
end


robot.writeGripper(false);

pause(1);