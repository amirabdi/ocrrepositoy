%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format compact
close all
clear all
clc
warning off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fid = fopen('text.txt', 'wt');
fprintf(fid,'Found     Real\n');
fclose(fid);

Train_images = loadMNISTImages('train-images.idx3-ubyte');
Train_labels = loadMNISTLabels('train-labels.idx1-ubyte');
Train_images=Train_images(:,1:1000);
Train_labels=Train_labels(1:1000,:);

% Test_images = loadMNISTImages('t10k-images.idx3-ubyte');
% Test_labels = loadMNISTLabels('train-labels.idx1-ubyte');

% We are using display_network from the autoencoder code

% figure,display_network(Train_images(:,1)); % Show the first 100 images
% disp(Train_labels(1:10));
% figure,display_network(Test_images(:,1)); % Show the first 100 images
% disp(Train_labels(1:10));

fid = fopen('text.txt', 'a+');
addpath('.\templ')

% Load templates
load('templates')
global templates

cnter=0;
for dset=1:size(Train_images,2)
    
    selected_Train_im=Train_images(:,dset);
    selected_Label_im=Train_labels(dset,:);
    
    % Read image
    imagen=255*(reshape(selected_Train_im,...
        sqrt(size(selected_Train_im,1)),...
        sqrt(size(selected_Train_im,1))));
    
    imagen=uint8(imagen);
    % Show image
    imagen1 = imagen;
    imshow(imagen1);
    pause(.1)
    %     title('INPUT IMAGE WITH NOISE')
    % Convert to gray scale
    if size(imagen,3)==3 %RGB image
        imagen=(rgb2gray(imagen));
    end
    % Convert to BW
    threshold = graythresh(imagen);
    
    imagen =~im2bw(imagen,threshold);
    imagen2 = imagen;
    %figure,imshow(imagen2);
    % title('before bwareaopen')
    % Remove all object containing fewer than 15 pixels
    imagen = bwareaopen(imagen,15);
    imagen3 = imagen;
    %figure,imshow(imagen3);
    %title('after bwareaopen')
    %Storage matrix word from image
    word=[ ];
    re=imagen;
    %Opens text.txt as file for write
    
    
    % Compute the number of letters in template file
    num_letras=size(templates{1,1},2);
    while 1
        %Fcn 'lines_crop' separate lines in text
        [fl re]=lines_crop(re); %fl= first line, re= remaining image
        imgn=fl;
        n=0;
        %Uncomment line below to see lines one by one
        %figure,imshow(fl);pause(2)
        %-----------------------------------------------------------------
        
        spacevector = [];      % to compute the total spaces betweeen
        % adjacent letter
        rc = fl;
        
        while 1
            %Fcn 'letter_crop' separate letters in a line
            [fc rc space]=letter_crop(rc);  %fc =  first letter in the line
            %rc =  remaining cropped line
            %space = space between the letter
            %   cropped and the next letter
            %uncomment below line to see letters one by one
            %figure,imshow(fc);pause(0.5)
            img_r = imresize(fc,[20 20]);   %resize letter so that correlation
            %can be performed
            n = n + 1;
            spacevector(n)=space;
            
            %Fcn 'read_letter' correlates the cropped letter with the images
            %given in the folder 'letters_numbers'
            letter = read_letter_num(img_r,num_letras);
            
            %letter concatenation
            word = [word letter];
            
            if isempty(rc)  %breaks loop when there are no more characters
                break;
            end
        end
        
        %-------------------------------------------------------------------
        
        %
        max_space = max(spacevector);
        no_spaces = 0;
        
        for x= 1:n   %loop to introduce space at requisite locations
            if spacevector(x+no_spaces)> (0.75 * max_space)
                no_spaces = no_spaces + 1;
                for m = x:n
                    word(n+x-m+no_spaces)=word(n+x-m+no_spaces-1);
                end
                word(x+no_spaces) = ' ';
                spacevector = [0 spacevector];
            end
        end
        
        
        %fprintf(fid,'%s\n',lower(word));%Write 'word' in text file (lower)
        fprintf(fid,'%s          %d \n',word,selected_Label_im);%Write 'word' in text file (upper)
        if str2double(word)~=selected_Label_im
            cnter=cnter+1;
        end
        
        % Clear 'word' variable
        word=[ ];
        %*When the sentences finish, breaks the loop
        if isempty(re)  %See variable 're' in Fcn 'lines'
            break
        end
    end
    
    %Open 'text.txt' file
    %     winopen('text.txt')
end

fclose(fid);
error=100*cnter/size(Train_images,2);
disp(['Error=' num2str(error) '%'])
winopen('text.txt')
