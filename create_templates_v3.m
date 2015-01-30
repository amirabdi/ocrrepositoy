%CREATE TEMPLATES
%Letter
clc;
close all;
clear all

for ij=1:200
    %Upper case letters
    A=imread(['.\training\upper\A\' num2str(ij-1) '.gif']);B=imread(['.\training\upper\B\' num2str(ij-1) '.gif']);
    C=imread(['.\training\upper\C\' num2str(ij-1) '.gif']);D=imread(['.\training\upper\D\' num2str(ij-1) '.gif']);
    E=imread(['.\training\upper\E\' num2str(ij-1) '.gif']);F=imread(['.\training\upper\F\' num2str(ij-1) '.gif']);
    G=imread(['.\training\upper\G\' num2str(ij-1) '.gif']);H=imread(['.\training\upper\H\' num2str(ij-1) '.gif']);
    I=imread(['.\training\upper\I\' num2str(ij-1) '.gif']);J=imread(['.\training\upper\J\' num2str(ij-1) '.gif']);
    K=imread(['.\training\upper\K\' num2str(ij-1) '.gif']);L=imread(['.\training\upper\L\' num2str(ij-1) '.gif']);
    M=imread(['.\training\upper\M\' num2str(ij-1) '.gif']);N=imread(['.\training\upper\N\' num2str(ij-1) '.gif']);
    O=imread(['.\training\upper\O\' num2str(ij-1) '.gif']);P=imread(['.\training\upper\P\' num2str(ij-1) '.gif']);
    Q=imread(['.\training\upper\Q\' num2str(ij-1) '.gif']);R=imread(['.\training\upper\R\' num2str(ij-1) '.gif']);
    S=imread(['.\training\upper\S\' num2str(ij-1) '.gif']);T=imread(['.\training\upper\T\' num2str(ij-1) '.gif']);
    U=imread(['.\training\upper\U\' num2str(ij-1) '.gif']);V=imread(['.\training\upper\V\' num2str(ij-1) '.gif']);
    W=imread(['.\training\upper\W\' num2str(ij-1) '.gif']);X=imread(['.\training\upper\X\' num2str(ij-1) '.gif']);
    Y=imread(['.\training\upper\Y\' num2str(ij-1) '.gif']);Z=imread(['.\training\upper\Z\' num2str(ij-1) '.gif']);
    %Lower case letters
    a=imread(['.\training\lower\a\' num2str(ij-1) '.gif']);b=imread(['.\training\lower\b\' num2str(ij-1) '.gif']);
    c=imread(['.\training\lower\c\' num2str(ij-1) '.gif']);d=imread(['.\training\lower\d\' num2str(ij-1) '.gif']);
    e=imread(['.\training\lower\e\' num2str(ij-1) '.gif']);f=imread(['.\training\lower\f\' num2str(ij-1) '.gif']);
    g=imread(['.\training\lower\g\' num2str(ij-1) '.gif']);h=imread(['.\training\lower\h\' num2str(ij-1) '.gif']);
    i=imread(['.\training\lower\i\' num2str(ij-1) '.gif']);j=imread(['.\training\lower\j\' num2str(ij-1) '.gif']);
    k=imread(['.\training\lower\k\' num2str(ij-1) '.gif']);l=imread(['.\training\lower\l\' num2str(ij-1) '.gif']);
    m=imread(['.\training\lower\m\' num2str(ij-1) '.gif']);n=imread(['.\training\lower\n\' num2str(ij-1) '.gif']);
    o=imread(['.\training\lower\o\' num2str(ij-1) '.gif']);p=imread(['.\training\lower\p\' num2str(ij-1) '.gif']);
    q=imread(['.\training\lower\q\' num2str(ij-1) '.gif']);r=imread(['.\training\lower\r\' num2str(ij-1) '.gif']);
    s=imread(['.\training\lower\s\' num2str(ij-1) '.gif']);t=imread(['.\training\lower\t\' num2str(ij-1) '.gif']);
    u=imread(['.\training\lower\u\' num2str(ij-1) '.gif']);v=imread(['.\training\lower\v\' num2str(ij-1) '.gif']);
    w=imread(['.\training\lower\w\' num2str(ij-1) '.gif']);x=imread(['.\training\lower\x\' num2str(ij-1) '.gif']);
    y=imread(['.\training\lower\y\' num2str(ij-1) '.gif']);z=imread(['.\training\lower\z\' num2str(ij-1) '.gif']);
    %Number
    one=  imread('letters_numbers\1.bmp');  two=imread('letters_numbers\2.bmp');
    three=imread('letters_numbers\3.bmp'); four=imread('letters_numbers\4.bmp');
    five= imread('letters_numbers\5.bmp');  six=imread('letters_numbers\6.bmp');
    seven=imread('letters_numbers\7.bmp');eight=imread('letters_numbers\8.bmp');
    nine= imread('letters_numbers\9.bmp'); zero=imread('letters_numbers\0.bmp');
    %*-*-*-*-*-*-*-*-*-*-*-
    uppercase=[A B C D E F G H I J K L M...
        N O P Q R S T U V W X Y Z];
    lowercase = [a b c d e f g h i j k ...
        l m n o p q r s t u v w x y z];
    number=uint8([imresize(one,[20,20])...
        imresize(two,[20,20])...
        imresize(three,[20,20])...
        imresize(four,[20,20])...
        imresize(five,[20,20])...
        imresize(six,[20,20])...
        imresize(seven,[20,20])...
        imresize(eight,[20,20])...
        imresize(nine,[20,20])...
        imresize(zero,[20,20])]);
    
    character=[uppercase number lowercase];
    templates{ij}=mat2cell(character,20,...
        [20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20 20 ...
        20 20 20 20 20 20]);
    
    save ('templates','templates')
    %     save (['.\templ\templates_' num2str(ij-1)],'templates')
    disp(['saving templates ' num2str(ij-1) '/200 (PLZ Wait) ...'])
end


%Upper case letters
A=imread('letters_numbers\A.bmp');B=imread('letters_numbers\B.bmp');
C=imread('letters_numbers\C.bmp');D=imread('letters_numbers\D.bmp');
E=imread('letters_numbers\E.bmp');F=imread('letters_numbers\F.bmp');
G=imread('letters_numbers\G.bmp');H=imread('letters_numbers\H.bmp');
I=imread('letters_numbers\I.bmp');J=imread('letters_numbers\J.bmp');
K=imread('letters_numbers\K.bmp');L=imread('letters_numbers\L.bmp');
M=imread('letters_numbers\M.bmp');N=imread('letters_numbers\N.bmp');
O=imread('letters_numbers\O.bmp');P=imread('letters_numbers\P.bmp');
Q=imread('letters_numbers\Q.bmp');R=imread('letters_numbers\R.bmp');
S=imread('letters_numbers\S.bmp');T=imread('letters_numbers\T.bmp');
U=imread('letters_numbers\U.bmp');V=imread('letters_numbers\V.bmp');
W=imread('letters_numbers\W.bmp');X=imread('letters_numbers\X.bmp');
Y=imread('letters_numbers\Y.bmp');Z=imread('letters_numbers\Z.bmp');
%lower case letters
a=imread('letters_numbers\a.bmp');b=imread('letters_numbers\b.bmp');
c=imread('letters_numbers\c.bmp');d=imread('letters_numbers\d.bmp');
e=imread('letters_numbers\e.bmp');f=imread('letters_numbers\f.bmp');
g=imread('letters_numbers\g.bmp');h=imread('letters_numbers\h.bmp');
i=imread('letters_numbers\i.bmp');j=imread('letters_numbers\j.bmp');
k=imread('letters_numbers\k.bmp');l=imread('letters_numbers\l.bmp');
m=imread('letters_numbers\m.bmp');n=imread('letters_numbers\n.bmp');
o=imread('letters_numbers\o.bmp');p=imread('letters_numbers\p.bmp');
q=imread('letters_numbers\q.bmp');r=imread('letters_numbers\r.bmp');
s=imread('letters_numbers\s.bmp');t=imread('letters_numbers\t.bmp');
u=imread('letters_numbers\u.bmp');v=imread('letters_numbers\v.bmp');
w=imread('letters_numbers\w.bmp');x=imread('letters_numbers\x.bmp');
y=imread('letters_numbers\y.bmp');z=imread('letters_numbers\z.bmp');
%Number
one=imread('letters_numbers\1.bmp');  two=imread('letters_numbers\2.bmp');
three=imread('letters_numbers\3.bmp');four=imread('letters_numbers\4.bmp');
five=imread('letters_numbers\5.bmp'); six=imread('letters_numbers\6.bmp');
seven=imread('letters_numbers\7.bmp');eight=imread('letters_numbers\8.bmp');
nine=imread('letters_numbers\9.bmp'); zero=imread('letters_numbers\0.bmp');
%*-*-*-*-*-*-*-*-*-*-*-
uppercase=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];
number=[one two three four five...
    six seven eight nine zero];
lowercase = [a b c d e f g h i j k ...
    l m n o p q r s t u v w x y z];
character=[uppercase number lowercase];

templates{200}=mat2cell(character,42,[24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24]);
save ('templates','templates')
disp(['saving templates ' num2str(200) '/200'])

clear all
