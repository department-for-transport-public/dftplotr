#' Colour palettes
#'
#' Returns a named vector containing the full list of available colours.
#'
#' @noRd
#' @examples

dft.colours <- c(
  "CorporateGreen" = "#006853",
  "CorporateGreen80"  = "#338675",
  "CorporateGreen60" =  "#66A498",
  "CorporateGreen40" = "#99C3BA",
  "CorporateGreenShade" =  "#004D3B",
  "Green" =  "#15B542",
  "Green80" =  "#44C468",
  "Green60" = "#72D38E",
  "Green40" =  "#A1E1B4",
  "GreenShade" =  "#0D872F",
  "Mint" =  "#1DE9B6",
  "Mint80" =  "#4AEDC5",
  "Mint60" =  "#77F2D3",
  "Mint40" =  "#A4F6E2",
  "MintShade" = "#00D4A4",
  "Lime"  = "#88EF1B",
  "Lime80" =  "#A0F249",
  "Lime60" =  "#B8F576",
  "Lime40" = "#CFF9A4",
  "LimeShade" = "#74D800",
  "Yellow" =  "#FFD833",
  "Yellow80" = "#FFE05C",
  "Yellow60" = "#FFE885",
  "Yellow40" = "#FFEFAD",
  "YellowShade" = "#FDBF27",
  "NavyBlue" = "#001A70",
  "NavyBlue80" =  "#33488D",
  "NavyBlue60" = "#6676A9",
  "NavyBlue40" = "#99A3C6",
  "NavyBlueShade" = "#00104D",
  "SkyBlue" = "#0082CA",
  "SkyBlue80" = "#339BD5",
  "SkyBlue60" =  "#66B4DF",
  "SkyBlue40" = "#99CDEA",
  "SkyBlueShade" = "#006AB0",
  "Red" =  "#FF0000",
  "Red80" = "#FF3333",
  "Red60" =  "#FF6666",
  "Red40" = "#FF9999",
  "RedShade" = "#D10000",
  "Orange" =  "#FF5500",
  "Orange80" = "#FF7733",
  "Orange60" = "#FF9966",
  "Orange40" = "#FFBB99",
  "OrangeShade" = "#DE4900",
  "Charcoal" = "#232323",
  "DarkGrey" = "#626262",
  "LightGrey" = "#EEF1F2")

#' Colour palettes
#'
#' Individual palettes returning 4 hex codes each
#' @export
#' @noRd
#' @examples
dft.palettes <- list(
  main.palette = extractColours(
  "CorporateGreen", "Lime60", "NavyBlue", "Orange80"
),

electric.brights = extractColours(
  "CorporateGreen", "Lime", "NavyBlue", "Orange"
),

just.beachy = extractColours(
  "CorporateGreen", "Yellow40", "NavyBlue80", "Mint40"
),

cycling.hills = extractColours(
  "CorporateGreen", "Lime60", "DarkGrey", "Yellow40"
),

mountain.train = extractColours(
  "CorporateGreen", "Lime40", "Charcoal", "Mint"
),

clear.skies = extractColours(
  "CorporateGreen", "Lime60", "NavyBlue", "SkyBlue60"
)
)

#' Gradient colour palettes
#'
#' Individual palettes returning 10 hex codes for a single shade gradient
#' @export
#' @noRd
#' @examples

dft.gradients <- list(
  main.palette = extractColours(
    "CorporateGreenShade", "CorporateGreen40"
    ),

  electric.brights = extractColours(
    "Red", "Yellow"
  ),

  just.beachy = extractColours(
    "Yellow", "SkyBlue"
  ),

  cycling.hills = extractColours(
    "Lime", "DarkGrey"
  ),

  mountain.train = extractColours(
    "Mint40", "Charcoal"
  ),

  clear.skies = extractColours(
    "NavyBlueShade", "SkyBlue40"
  )
)
