module DateFormat.Language
    exposing
        ( Language
        , english
        , spanish
        )

{-|


## Fun fact: Some people don't know english.

That's why it's important to include alternative date formatting options for other languages!

This module exposes `Language`, along with a few implementations.

(If you want to see `french`, `german`, or `greek`, please add them in! I'm happy to make your language a part of the package!)


### Language

@docs Language


### Languages

@docs english, spanish

-}

import Time exposing (Month(..), Weekday(..))


{-| A record with options for your language.
-}
type alias Language =
    { toMonthName : Month -> String
    , toMonthAbbreviation : Month -> String
    , toWeekdayName : Weekday -> String
    , toWeekdayAbbreviation : Weekday -> String
    , toAmPm : Int -> String
    , toOrdinalSuffix : Int -> String
    }



-- English


toEnglishMonthName : Month -> String
toEnglishMonthName month =
    case month of
        Jan ->
            "January"

        Feb ->
            "February"

        Mar ->
            "March"

        Apr ->
            "April"

        May ->
            "May"

        Jun ->
            "June"

        Jul ->
            "July"

        Aug ->
            "August"

        Sep ->
            "September"

        Oct ->
            "October"

        Nov ->
            "November"

        Dec ->
            "December"


toEnglishWeekdayName : Weekday -> String
toEnglishWeekdayName weekday =
    case weekday of
        Mon ->
            "Monday"

        Tue ->
            "Tuesday"

        Wed ->
            "Wednesday"

        Thu ->
            "Thursday"

        Fri ->
            "Friday"

        Sat ->
            "Saturday"

        Sun ->
            "Sunday"


toEnglishAmPm : Int -> String
toEnglishAmPm hour =
    if hour > 11 then
        "pm"
    else
        "am"


toEnglishSuffix : Int -> String
toEnglishSuffix num =
    case modBy 100 num of
        11 ->
            "th"

        12 ->
            "th"

        13 ->
            "th"

        _ ->
            case modBy 10 num of
                1 ->
                    "st"

                2 ->
                    "nd"

                3 ->
                    "rd"

                _ ->
                    "th"


{-| The english language! (used by default)
-}
english : Language
english =
    Language
        toEnglishMonthName
        (toEnglishMonthName >> String.left 3)
        toEnglishWeekdayName
        (toEnglishWeekdayName >> String.left 3)
        toEnglishAmPm
        toEnglishSuffix



-- Spanish


{-| The spanish language!
-}
spanish : Language
spanish =
    Language
        toSpanishMonthName
        (toSpanishMonthName >> String.left 3)
        toSpanishWeekdayName
        (toSpanishWeekdayName >> String.left 3)
        toEnglishAmPm
        (always "°")


toSpanishMonthName : Time.Month -> String
toSpanishMonthName month =
    case month of
        Jan ->
            "Enero"

        Feb ->
            "Febrero"

        Mar ->
            "Marzo"

        Apr ->
            "Abril"

        May ->
            "Mayo"

        Jun ->
            "Junio"

        Jul ->
            "Julio"

        Aug ->
            "Agosto"

        Sep ->
            "Septiembre"

        Oct ->
            "Octubre"

        Nov ->
            "Noviembre"

        Dec ->
            "Diciembre"


toSpanishWeekdayName : Time.Weekday -> String
toSpanishWeekdayName weekday =
    case weekday of
        Mon ->
            "Lunes"

        Tue ->
            "Martes"

        Wed ->
            "Miércoles"

        Thu ->
            "Jueves"

        Fri ->
            "Viernes"

        Sat ->
            "Sábado"

        Sun ->
            "Domingo"
