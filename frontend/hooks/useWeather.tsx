import useSWR from "swr";
import objectPath from "object-path";

export type Weather = {
  temperature: number;
  feelsLike: number;
  wind: number;
  humidity: number;
  description: string;
  icon: string;
};

const rawToWeather: (data: any) => Weather = (data) => ({
  temperature: objectPath.get(data, "main.temp", 0.0),
  feelsLike: objectPath.get(data, "main.feels_like", 0.0),
  wind: objectPath.get(data, "wind.speed", 0.0),
  humidity: objectPath.get(data, "main.humidity", 0),
  description: objectPath.get(data, "weather.0.description", ""),
  icon: objectPath.get(data, "weather.0.icon_uri", ""),
});

const fetcher = (path) =>
  fetch(path)
    .then((response) => response.json())
    .then((data) => rawToWeather(data));

export const useWeather = (location_slug: string) => {
  const { data, error } = useSWR<Weather, Error>(
    location_slug
      ? `${process.env.NEXT_PUBLIC_API_BASE}/api/locations/${location_slug}/weather`
      : null,
    fetcher
  );

  return {
    weather: data,
    isLoading: !data && !error,
    isError: error,
  };
};

export default useWeather;
