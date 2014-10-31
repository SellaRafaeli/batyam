//src: http://www.quora.com/How-is-the-fuzzy-search-algorithm-in-Sublime-Text-designed, http://jsfiddle.net/bulat/CCryL/
function isFuzzyMatch(obj, query) {
    var tokens = query.toLowerCase().split(''),
    matches = [];
    searchSet = [obj];
    searchSet.forEach(function(string) {
        var tokenIndex = 0,
        stringIndex = 0,
        matchWithHighlights = '',
        matchedPositions = [];

        string = obj.value.toLowerCase();

        while (stringIndex < string.length) {
            if (string[stringIndex] === tokens[tokenIndex]) {
                matchWithHighlights += highlight(string[stringIndex]);
                matchedPositions.push(stringIndex);
                tokenIndex++;

                if (tokenIndex >= tokens.length) {
                    matches.push({
                        match: string,
                        highlighted: matchWithHighlights + string.slice(stringIndex + 1),
                        positions: matchedPositions
                    });

                    break;
                }
            }
            else {
                matchWithHighlights += string[stringIndex];
            }

            stringIndex++;
        }
    });

    return matches;
}


function fuzzyMatch(searchSet, query) {
    var tokens = query.toLowerCase().split(''),
    matches = [];

    searchSet.forEach(function(string) {
        var tokenIndex = 0,
        stringIndex = 0,
        matchWithHighlights = '',
        matchedPositions = [];

        string = string.toLowerCase();

        while (stringIndex < string.length) {
            if (string[stringIndex] === tokens[tokenIndex]) {
                matchWithHighlights += highlight(string[stringIndex]);
                matchedPositions.push(stringIndex);
                tokenIndex++;

                if (tokenIndex >= tokens.length) {
                    matches.push({
                        match: string,
                        highlighted: matchWithHighlights + string.slice(stringIndex + 1),
                        positions: matchedPositions
                    });

                    break;
                }
            }
            else {
                matchWithHighlights += string[stringIndex];
            }

            stringIndex++;
        }
    });

    return matches;
}

function highlight(string) {
    return '<span class="highlight">' + string + '</span>';
}

// function search() {
//     var query = $('input').first().val(),
//     searchSet = $('textarea').first().val().split('\n'),
//     matches = fuzzyMatch(searchSet, query),
//     $resultList = $('ul');    
//     $resultList.empty();
//     matches.forEach(function(match) {        
//         $('<li/>').html(match.highlighted).appendTo($resultList);
//         //console.log('Match: ', match);
//     });

//     $(".services li").first().addClass("selected");
// }

// $('a').click(function() {
//     search();
//     return false;
// });

// $('#input').keyup(function(e) {
//     //if (e.which === 13) {
//         //console.log("keyup");
        
//     //}
// });

//  $("input").keyup(function(e) {    
//     if (e.keyCode == 38) { // up
//         var selected = $(".selected");
//         $(".services li").removeClass("selected");
//         if (selected.prev().length == 0) {
//             selected.siblings().last().addClass("selected");
//         } else {
//             selected.prev().addClass("selected");
//         }
//         e.preventDefault();        
//     }

//     else if (e.keyCode == 40) { // down
//         var selected = $(".selected");
//         $(".services li").removeClass("selected");
//         if (selected.next().length == 0) {
//             selected.siblings().first().addClass("selected");
//         } else {
//             selected.next().addClass("selected");
//         }
//         e.preventDefault();
//     }    

//     else if (e.keyCode == 13) { //enter 
//         selectOption();
//     }

//     else {
//         search();
//     }
// });

// function selectOption() {
//     $("input").val($(".selected a").text());    
// }