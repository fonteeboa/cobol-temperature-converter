       IDENTIFICATION DIVISION.
       PROGRAM-ID. TemperatureConverter.
       AUTHOR. Jv Fonte com Chá de Gepetê.
       DATE-WRITTEN. 2024-11-11.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 CELSIUS            PIC 9(3)V99.
       01 FAHRENHEIT         PIC 9(3)V99.
       01 KELVIN             PIC 9(3)V99.
       01 USER-OPTION        PIC X.
       01 REPEAT             PIC X VALUE 'Y'.

       PROCEDURE DIVISION.

       DISPLAY-WELCOME.
           DISPLAY "**********************************************"
           DISPLAY "*                                            *"
           DISPLAY "*         WELCOME TO TEMPERATURE CONVERTER   *"
           DISPLAY "*                                            *"
           DISPLAY "*  Select a conversion type and follow       *"
           DISPLAY "*  the prompts to convert temperatures       *"
           DISPLAY "*  between Celsius, Kelvin, and Fahrenheit.  *"
           DISPLAY "*                                            *"
           DISPLAY "*               Enjoy your experience!       *"
           DISPLAY "*                                            *"
           DISPLAY "**********************************************"
           DISPLAY "Press Enter to continue..." WITH NO ADVANCING
           ACCEPT USER-OPTION.

       DISPLAY-MENU.
           DISPLAY "TEMPERATURE CONVERTER"
           DISPLAY "Select the temperature conversion type:"
           DISPLAY "1 - Celsius to Kelvin"
           DISPLAY "2 - Celsius to Fahrenheit"
           DISPLAY "3 - Kelvin to Celsius"
           DISPLAY "4 - Kelvin to Fahrenheit"
           DISPLAY "5 - Fahrenheit to Celsius"
           DISPLAY "6 - Fahrenheit to Kelvin"
           DISPLAY "Option: " WITH NO ADVANCING.

       ASK-REPEAT.
           DISPLAY "Would you like another conversion?".
           DISPLAY "(Y/N): " WITH NO ADVANCING
           ACCEPT REPEAT
           MOVE FUNCTION UPPER-CASE(REPEAT) TO REPEAT.

       MAIN-PARAGRAPH.
           PERFORM DISPLAY-WELCOME
           PERFORM WITH TEST AFTER UNTIL REPEAT = 'N'
               PERFORM DISPLAY-MENU
               ACCEPT USER-OPTION
               EVALUATE USER-OPTION
                   WHEN '1' 
                       PERFORM CONVERT-CELSIUS-TO-KELVIN
                       PERFORM ASK-REPEAT
                   WHEN '2' 
                       PERFORM CONVERT-CELSIUS-TO-FAHRENHEIT
                       PERFORM ASK-REPEAT
                   WHEN '3' 
                       PERFORM CONVERT-KELVIN-TO-CELSIUS
                       PERFORM ASK-REPEAT
                   WHEN '4' 
                       PERFORM CONVERT-KELVIN-TO-FAHRENHEIT
                       PERFORM ASK-REPEAT
                   WHEN '5' 
                       PERFORM CONVERT-FAHRENHEIT-TO-CELSIUS
                       PERFORM ASK-REPEAT
                   WHEN '6' 
                       PERFORM CONVERT-FAHRENHEIT-TO-KELVIN
                       PERFORM ASK-REPEAT
                   WHEN OTHER 
                       DISPLAY "Invalid option. Please try again."
               END-EVALUATE
           END-PERFORM
           DISPLAY "Thank you! Feel free to use it again anytime!".
           STOP RUN.

       CONVERT-CELSIUS-TO-KELVIN.
           DISPLAY "Celsius to Kelvin"
           DISPLAY "Enter temperature in Celsius: " WITH NO ADVANCING
           ACCEPT CELSIUS
           COMPUTE KELVIN = CELSIUS + 273.15
           DISPLAY "The temperature in Kelvin is: " KELVIN.

       CONVERT-CELSIUS-TO-FAHRENHEIT.
           DISPLAY "Celsius to Fahrenheit"
           DISPLAY "Enter temperature in Celsius: " WITH NO ADVANCING
           ACCEPT CELSIUS
           COMPUTE FAHRENHEIT = (CELSIUS * 9 / 5) + 32
           DISPLAY "The temperature in Fahrenheit is: " FAHRENHEIT.

       CONVERT-KELVIN-TO-CELSIUS.
           DISPLAY "Kelvin to Celsius"
           DISPLAY "Enter temperature in Kelvin: " WITH NO ADVANCING
           ACCEPT KELVIN
           COMPUTE CELSIUS = KELVIN - 273.15
           DISPLAY "The temperature in Celsius is: " CELSIUS.

       CONVERT-KELVIN-TO-FAHRENHEIT.
           DISPLAY "Kelvin to Fahrenheit"
           DISPLAY "Enter temperature in Kelvin: " WITH NO ADVANCING
           ACCEPT KELVIN
           COMPUTE FAHRENHEIT = ((KELVIN - 273.15) * 9 / 5) + 32
           DISPLAY "The temperature in Fahrenheit is: " FAHRENHEIT.

       CONVERT-FAHRENHEIT-TO-CELSIUS.
           DISPLAY "Fahrenheit to Celsius"
           DISPLAY "Enter temperature in Fahrenheit: " WITH NO ADVANCING
           ACCEPT FAHRENHEIT
           COMPUTE CELSIUS = (FAHRENHEIT - 32) * 5 / 9
           DISPLAY "The temperature in Celsius is: " CELSIUS.

       CONVERT-FAHRENHEIT-TO-KELVIN.
           DISPLAY "Fahrenheit to Kelvin"
           DISPLAY "Enter temperature in Fahrenheit: " WITH NO ADVANCING
           ACCEPT FAHRENHEIT
           COMPUTE KELVIN = ((FAHRENHEIT - 32) * 5 / 9) + 273.15
           DISPLAY "The temperature in Kelvin is: " KELVIN.
