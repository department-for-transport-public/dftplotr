#' Colour palettes
#'
#' A named vector containing the full list of available colours.
#'
#' @noRd

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

dft.palettes <- list(
  main.palette = extract_colours(
    "CorporateGreen", "Lime60", "NavyBlue", "Orange80"
  ),

  electric.brights = extract_colours(
    "CorporateGreen", "Lime", "NavyBlue", "Orange"
  ),

  just.beachy = extract_colours(
    "Orange", "NavyBlueShade", "Yellow80", "DarkGrey", "Mint40"
  ),

  cycling.hills = extract_colours(
    "Green", "Charcoal", "CorporateGreen40", "CorporateGreenShade", "Lime40"
  ),

  mountain.train = extract_colours(
    "RedShade", "Yellow80", "NavyBlue80", "Orange80", "Charcoal", "MintShade"
  ),

  clear.skies = extract_colours(
    "NavyBlue", "Mint40", "NavyBlue60", "Yellow80", "SkyBlueShade", "Lime60"
  )
)

#' Gradient colour palettes
#'
#' Individual palettes returning 10 hex codes for a single shade gradient
#' @export
#' @noRd

dft.gradients <- list(
  main.palette = extract_colours(
    "CorporateGreenShade", "CorporateGreen40"
  ),

  electric.brights = extract_colours(
    "Red", "Yellow"
  ),

  just.beachy = extract_colours(
    "Yellow", "SkyBlue"
  ),

  cycling.hills = extract_colours(
    "Lime", "DarkGrey"
  ),

  mountain.train = extract_colours(
    "Mint40", "Charcoal"
  ),

  clear.skies = extract_colours(
    "NavyBlueShade", "SkyBlue40"
  )
)
