package org.soujava.player;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class Team {

    static final int SIZE = 20;

    private String name;

    private List<Player> players = new ArrayList<>();

    @Deprecated
    Team() {
    }

    private Team(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void add(Player player) {
        Objects.requireNonNull(player, "player is required");

        if (players.size() == SIZE) {
            throw new IllegalArgumentException("The team is full");
        }
        this.players.add(player);
    }

    public List<Player> getPlayers() {
        return Collections.unmodifiableList(players);
    }

    public static Team of(String name) {
        return new Team(Objects.requireNonNull(name, "name is required"));
    }
}