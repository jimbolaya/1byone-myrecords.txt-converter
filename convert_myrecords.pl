#!/usr/bin/perl

# Data Format:
#Time:12:13, Mon,1/ 1/2018
#Weight:98.6kg   Overweight
#Body water:49.1%   Inadequate
#Body fat:31.2%   Obese
#Bone Mass:3.4kg   Optimal
#Visceral fat:12.0   Alert
#BMR:1948.0 kcal   Underweight
#Muscle Mass:64.5kg   Optimal
#BMI:30.4   Overweight


my $myrecords = "myrecords.txt";
open (DATAIN, "< $myrecords" ) or die "Can't open $myrecords: $!\n";

my $count = 0;

my $linein;

print ("Time,Day,Date,Weight,Body water,Body fat,Bone Mass,Visceral fat,BMR,Muscle Mass,BMI\n");

while ($linein = <DATAIN> ) {
  if ($count == 0) { #first line is user name
    chomp ($linein);
    $username = $linein;
    $count ++;
    next();
  }

# Chop up line
# Get field
  $field = (split(':',$linein))[0];
# print "$field\n";
# Giant if statement to 

#  if ( $field eq "Time" ) {
    if( $linein =~ /Time:(.*)/ ) {
       $time = $1;
    }
#  }

  if ( $field eq "Weight" ) {
    $weight = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "Body water" ) {
    $bwater = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "Body fat" ) {
    $bfat = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "Bone Mass" ) {
    $bmass = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "Visceral fat" ) {
    $vfat = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "BMR" ) {
    $bmr = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "Muscle Mass" ) {
    $mmass = (split '   ', (split(':',$linein))[1])[0];
  }

  if ( $field eq "BMI" ) {
    $bmi = (split '   ', (split(':',$linein))[1])[0];
    print ("$time,$weight,$bwater,$bfat,$bmass,$vfat,$bmr,$mmass,$bmi\n");
  }


  $count ++; 
}
