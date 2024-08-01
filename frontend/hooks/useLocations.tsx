import useSWR from "swr";

export type Location = {
  id: number;
  slug: string;
  name: string;
  latitude: number;
  longitude: number;
  created_at: Date;
  updated_at: Date;
};

const locations: Array<Location> = [
  { slug: "new_york", name: "New York", id: 1 },
  { slug: "boston", name: "Boston", id: 2 },
  { slug: "chicago", name: "Chicago", id: 3 },
];

const fetcher = (path) =>
  fetch(path)
    .then((response) => response.json());

export const useLocations = () => {
  const { data, error } = useSWR<Location, Error>(
    `${process.env.NEXT_PUBLIC_API_BASE}/api/locations`,
    fetcher
  );

  return {
    locations: data,
    isLoading: !data && !error,
    isError: error,
  };
};

export const useLocation: (slug: string) => Location | null = (slug) => {
  const { locations } = useLocations();

  return locations ? locations.find((location) => location.slug === slug) : null;
};